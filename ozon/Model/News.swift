//
//  News.swift
//  ozon
//
//  Created by Administrator on 04/01/2019.
//  Copyright © 2019 Amplitudo. All rights reserved.
//

import Foundation
struct News {
    private(set) public var title:String
    private(set) public var date:String
    private(set) public var content:String
    private(set) public var imageName:String
    
    init(title: String, date: String, content:String, imageName:String){
        self.title = title
        self.date = date
        self.content = content
        self.imageName = imageName
        
    }
}
