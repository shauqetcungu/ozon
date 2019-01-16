//
//  VijestiOpsirnijeVC.swift
//  ozon
//
//  Created by Administrator on 06/01/2019.
//  Copyright © 2019 Amplitudo. All rights reserved.
//

import UIKit

class VijestiOpsirnijeVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
   
    
    
    @IBOutlet weak var vijestiCollection: UICollectionView!

    private(set) public var news = [Article]()
    override func viewDidLoad() {
        super.viewDidLoad()

        vijestiCollection.dataSource = self
        vijestiCollection.delegate = self
    }

    func initVijesti(category: Category){
        news = OzonDataService.instance.getNews(forNewsTitle: category.title)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return news.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VijestiCell", for: indexPath) as? VijestiCell{
            let vijesti = news[indexPath.row]
            cell.updateViews(news: vijesti)
            return cell
        }
        
        return VijestiCell()
    }

}
