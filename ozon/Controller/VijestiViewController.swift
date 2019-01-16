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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return OzonDataService.instance.getNews().count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell") as? CategoryCell{
            let category = OzonDataService.instance.getNews()[indexPath.row]
            cell.updateViews(news: category)
            return cell
        }
        else{
            return CategoryCell()
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc  = storyboard?.instantiateViewController(withIdentifier: "VijestiOpsirnijeViewController") as? VijestiOpsirnijeViewController
        vc?.name = OzonDataService.instance.getNews()[indexPath.row].title
        vc?.date = OzonDataService.instance.getNews()[indexPath.row].date
        vc?.content = OzonDataService.instance.getNews()[indexPath.row].content
        
        let myURL = URL(string: OzonDataService.instance.getNews()[indexPath.row].image!)
        KingfisherManager.shared.retrieveImage(with: myURL!, options: nil, progressBlock: nil, completionHandler: { image, error, cacheType, imageURL in
            vc?.image = image!
        })
        /*
        vc?.image  = UIImage(named: OzonDataService.instance.getNews()[indexPath.row].image!)!
    
        let myURLString: String = "\(OzonDataService.instance.getNews()[indexPath.row].image!)"
        if let myURL = URL(string: myURLString), let myData = try? Data(contentsOf: myURL), let image = UIImage(data: myData) {
            vc?.image  = image
        }
         */
        
        self.navigationController?.pushViewController(vc!, animated: false)
    }
}
