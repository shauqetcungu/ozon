//
//  VijestiOpsirnijeViewController.swift
//  ozon
//
//  Created by Administrator on 07/01/2019.
//  Copyright © 2019 Amplitudo. All rights reserved.
//

import UIKit

class VijestiOpsirnijeViewController: UIViewController{
    
    @IBOutlet weak var detailTitleNews: UILabel!
    @IBOutlet weak var detailDateNews: UILabel!
    @IBOutlet weak var detailContentNews: UILabel!
    @IBOutlet weak var detailImageNews: UIImageView!
    @IBOutlet weak var detailScrollNews: UIScrollView!
    
    var name = ""
    var date = ""
    var content = ""
    var image = UIImage()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailTitleNews.text = name
        detailDateNews.text = date
        detailContentNews.text = content
        detailImageNews.image = image
        detailScrollNews.contentLayoutGuide.bottomAnchor.constraint(equalTo: detailContentNews.bottomAnchor).isActive = true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
