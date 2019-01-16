//
//  NewsViewController.swift
//  ozon
//
//  Created by Administrator on 04/01/2019.
//  Copyright © 2019 Amplitudo. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
   
    

    @IBOutlet weak var newsCollection: UICollectionView!
    private(set) public var news = [News]()
    override func viewDidLoad() {
        super.viewDidLoad()
        newsCollection.dataSource = self
        newsCollection.delegate = self
    }

    func initNews(category: Category){
        news = OzonDataService.instance.getNews(forCategorytitle: Category.title)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return news.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewsCell", for: indexPath) as? NewsCell{
            let new = news[indexPath.row]
            cell.updateViews(news: new)
            
            
            return cell
        }
            
            return NewsCell()
    }

}
