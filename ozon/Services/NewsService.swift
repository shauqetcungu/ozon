//
//  NewsService.swift
//  ozon
//
//  Created by Administrator on 07/02/2019.
//  Copyright © 2019 Amplitudo. All rights reserved.
//

import Foundation

class NewsService {
    
    static let instance = NewsService()
    var news = [Category]()
    
    func findAllNews(completion: @escaping  (_ Success: Bool) -> ()){
        
        let url = URL(string : "http://ozon.org.me/wp-json/wp/v2/posts?category_name=vijesti")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            guard let data = data else {return}
            do {
                self.news = try JSONDecoder().decode([Category].self, from: data)
            }
            catch let error{
                debugPrint(error as Any)
            }
            completion(true)
            
        }.resume()
    }
}
