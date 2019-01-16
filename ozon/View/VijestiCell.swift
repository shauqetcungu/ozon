//
//  VijestiCell.swift
//  ozon
//
//  Created by Administrator on 06/01/2019.
//  Copyright © 2019 Amplitudo. All rights reserved.
//

import UIKit

class VijestiCell: UITableViewCell {

    @IBOutlet weak var vijestiTitle: UILabel!
    
    func updateViews(news: Article){
        
      vijestiTitle.text = news.title
    }

}
