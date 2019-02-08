//
//  SopstenjaOpsirnijeViewController.swift
//  ozon
//
//  Created by Administrator on 07/01/2019.
//  Copyright © 2019 Amplitudo. All rights reserved.
//

import UIKit

class SopstenjaOpsirnijeViewController: UIViewController {
    //var data: AnnouncementDetail?
    @IBOutlet weak var detailTitleAnn: UILabel!
    @IBOutlet weak var detailDateAnn: UILabel!
    @IBOutlet weak var detailContentAnn: UILabel!
    @IBOutlet weak var detailImageAnn: UIImageView!
    @IBOutlet weak var detailScrollAnn: UIScrollView!
    
    var name = ""
    var date = ""
    var content = ""
    var image = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailTitleAnn.text = name
        detailDateAnn.text = date
        detailContentAnn.text = content
        detailImageAnn.image = image
        detailScrollAnn.contentLayoutGuide.bottomAnchor.constraint(equalTo: detailContentAnn.bottomAnchor).isActive = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
