//
//  VijestiViewController.swift
//  ozon
//
//  Created by Administrator on 04/01/2019.
//  Copyright © 2019 Amplitudo. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

class VijestiViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    @IBOutlet weak var categoryTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.categoryTable.rowHeight = 380;
        categoryTable.dataSource = self
        categoryTable.delegate = self
        NewsService.instance.findAllNews { (success) in
            DispatchQueue.main.async {
                self.categoryTable.reloadData()
            }
        }
        
        let systemFontAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18.0)]
        UITabBarItem.appearance().setTitleTextAttributes(systemFontAttributes, for: .normal)
        let tabBar = self.tabBarController!.tabBar
        
        tabBar.selectionIndicatorImage = UIImage().createSelectionIndicator(color: UIColor.orange, size: CGSize(width: tabBar.frame.width/CGFloat(tabBar.items!.count), height: 70), lineWidth: 2.0)
        
        //SWIPE BEZ ANIMACIJE?????
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:)))
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:)))
        leftSwipe.direction = .left
        rightSwipe.direction = .right
        self.view.addGestureRecognizer(leftSwipe)
        self.view.addGestureRecognizer(rightSwipe)
    }

    @objc func handleSwipes(_ sender:UISwipeGestureRecognizer) {
        if sender.direction == .left {
            self.tabBarController!.selectedIndex += 1
        }
        if sender.direction == .right {
            self.tabBarController!.selectedIndex -= 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath) as? CategoryCell{
            let news = NewsService.instance.news[indexPath.row]
            cell.updateViews(news: news)
            return cell
        }
        else{
            return UITableViewCell()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return NewsService.instance.news.count
    }

   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let vc  = storyboard?.instantiateViewController(withIdentifier: "VijestiOpsirnijeViewController") as? VijestiOpsirnijeViewController
    vc?.name = NewsService.instance.news[indexPath.row].title.html2String
    vc?.date = NewsService.instance.news[indexPath.row].date
    vc?.content = NewsService.instance.news[indexPath.row].content.html2String
    
    let myURL = URL(string: NewsService.instance.news[indexPath.row].image!)
    KingfisherManager.shared.retrieveImage(with: myURL!, options: nil, progressBlock: nil, completionHandler: { image, error, cacheType, imageURL in
        vc?.image = image!
    })
    
    self.navigationController?.pushViewController(vc!, animated: false)
    }
}
