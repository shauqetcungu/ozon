//
//  DetailsCell.swift
//  ozon
//
//  Created by Administrator on 07/01/2019.
//  Copyright © 2019 Amplitudo. All rights reserved.
//

import UIKit

class DetailsCell: UICollectionViewCell {
    @IBOutlet weak var detailTitle: UILabel!
    @IBOutlet weak var detailDate: UILabel!
    @IBOutlet weak var detailContent: UILabel!
    @IBOutlet weak var detailImage: UIImageView!
    
    func updateViewsDetails(details: Article){
        detailTitle.text = details.title
        detailDate.text = details.date
        detailContent.text = details.content
        
        let url = URL(fileURLWithPath: details.image!)
        let data = try? Data(contentsOf: url)
        
        if let imageData = data {
            detailImage.image  = UIImage(data: imageData)
        }
    }
}
