//
//  AnnouncementsCell.swift
//  ozon
//
//  Created by Administrator on 04/01/2019.
//  Copyright © 2019 Amplitudo. All rights reserved.
//

import UIKit

class AnnouncementsCell: UITableViewCell {

   
    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var categoryTitle: UILabel!
    @IBOutlet weak var categoryContent: UILabel!
    @IBOutlet weak var categoryDate: UILabel!
    
    func updateViewsAnnouncements(announcements: Article){
        let myURLString: String = announcements.image!
        let myURL = URL(string: myURLString)
        categoryImage.kf.setImage(with:myURL)
        categoryTitle.text = announcements.title
        categoryDate.text = announcements.date
        
    }

}
