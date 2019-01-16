//
//  Detail.swift
//  ozon
//
//  Created by Administrator on 07/01/2019.
//  Copyright © 2019 Amplitudo. All rights reserved.
//

import Foundation
struct Detail{
    private(set) public var title: String
    private(set) public var date: String
    private(set) public var content: String
    private(set) public var imageName: String
    
    init(title: String,imageName: String,date: String,content: String){
        self.title = title
        self.imageName = imageName
        self.date = date
        self.content = content
    }
}
