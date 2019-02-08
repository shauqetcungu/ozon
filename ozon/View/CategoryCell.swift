//
//  CategoryCell.swift
//  ozon
//
//  Created by Administrator on 04/01/2019.
//  Copyright © 2019 Amplitudo. All rights reserved.
//

import UIKit

class CategoryCell: UITableViewCell {

    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var categoryTitle: UILabel!
    @IBOutlet weak var categoryContent: UILabel!
    @IBOutlet weak var categoryDate: UILabel!
    
    func updateViews(news: Category){
        let myURLString: String = news.image!
        let myURL = URL(string: myURLString)
        categoryImage.kf.setImage(with:myURL)
        categoryTitle.text = news.title
        categoryDate.text = news.date
        
    }

}
