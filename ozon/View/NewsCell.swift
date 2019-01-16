//
//  NewsCell.swift
//  ozon
//
//  Created by Administrator on 04/01/2019.
//  Copyright © 2019 Amplitudo. All rights reserved.
//

import UIKit

class NewsCell: UICollectionViewCell {
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var newsDate: UILabel!
    @IBOutlet weak var newsContent: UILabel!
    
    func updateViews(news: News){
        newsImage.image = UIImage(named: news.imageName)
        newsTitle.text = news.title
        newsDate.text = news.date
        newsContent.text = news.content
    }
}
