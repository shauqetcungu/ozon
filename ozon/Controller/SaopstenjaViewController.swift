//
//  SaopstenjaViewController.swift
//  ozon
//
//  Created by Administrator on 04/01/2019.
//  Copyright © 2019 Amplitudo. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

class SaopstenjaViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    @IBOutlet weak var categoryTableAnnouncements: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.categoryTableAnnouncements.rowHeight = 380;
        categoryTableAnnouncements.dataSource = self
        categoryTableAnnouncements.delegate = self
        
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
        return OzonDataService.instance.getAnnouncements().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "AnnouncementsCell") as? AnnouncementsCell{
            let announcements = OzonDataService.instance.getAnnouncements()[indexPath.row]
            cell.updateViewsAnnouncements(announcements: announcements)
            return cell
        }
        else{
            return AnnouncementsCell()
        }
    }

     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      let vc  = storyboard?.instantiateViewController(withIdentifier: "SopstenjaOpsirnijeViewController") as? SopstenjaOpsirnijeViewController
        vc?.name = OzonDataService.instance.getAnnouncements()[indexPath.row].title
        vc?.date = OzonDataService.instance.getAnnouncements()[indexPath.row].date
        vc?.content = OzonDataService.instance.getAnnouncements()[indexPath.row].content
        let myURL = URL(string: OzonDataService.instance.getAnnouncements()[indexPath.row].image!)
        KingfisherManager.shared.retrieveImage(with: myURL!, options: nil, progressBlock: nil, completionHandler: { image, error, cacheType, imageURL in
            vc?.image = image!
        })
       self.navigationController?.pushViewController(vc!, animated: false)
    }
}
