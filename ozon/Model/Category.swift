//
//  Category.swift
//  ozon
//
//  Created by Administrator on 04/01/2019.
//  Copyright © 2019 Amplitudo. All rights reserved.
//

import Foundation

struct Category {
    private(set) public var title:String
    private(set) public var imageName:String
    private(set) public var date:String
    
    init(title: String, imageName:String, date:String){
        self.title = title
        self.imageName = imageName
        self.date = date
    }
}
