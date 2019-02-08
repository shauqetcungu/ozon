//
//  AnnouncementsService.swift
//  ozon
//
//  Created by Administrator on 08/02/2019.
//  Copyright © 2019 Amplitudo. All rights reserved.
//

import Foundation

class AnnouncementsService {
    
    static let instance = AnnouncementsService()
    var announcements = [Announcements]()
    
    func findAllAnnouncements(completion: @escaping  (_ Success: Bool) -> ()){
        
        let url = URL(string : "http://ozon.org.me/wp-json/wp/v2/posts?category_name=Saopstenja%20za%20javnost")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            guard let data = data else {return}
            do {
                self.announcements = try JSONDecoder().decode([Announcements].self, from: data)
            }
            catch let error{
                debugPrint(error as Any)
            }
            completion(true)
            
        }.resume()
    }
}
