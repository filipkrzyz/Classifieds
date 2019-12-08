//
//  ViewController.swift
//  Classifieds
//
//  Created by Filip Krzyzanowski on 08/12/2019.
//  Copyright © 2019 Filip Krzyzanowski. All rights reserved.
//

import UIKit

class CategoriesVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    /// Array of sorted categories based on number of clicks in descending order
    var categories = [Category]()
    
    private let cellId = "CollectionCell"
    
    let sqliteManager = SQLiteManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .lightGray
        
        navigationItem.title = "Categories"
        
        // register cell
        collectionView!.register(CustomLabeledCell.self, forCellWithReuseIdentifier: cellId)
        
        categories = sqliteManager.selectData()
        sortCategories()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return categories.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CustomLabeledCell
        
        cell.backgroundColor = .black
        
        cell.categoryName = self.categories[indexPath.row].categoryName
        
        cell.imageData = self.categories[indexPath.row].images?[0]
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let size: CGSize
        
        let frameWidth = self.collectionView.frame.size.width
        let cellHeight = self.collectionView.frame.height/5
        let inset: CGFloat = 16
        
        if UserDefaults.standard.bool(forKey: "launchedBefore") {
            if indexPath.row == 0 {
                size = CGSize(width: (frameWidth - (2*inset)), height: cellHeight)
            } else if indexPath.row == 1 {
                size = CGSize(width: ((frameWidth - (3*inset))/3)*2, height: cellHeight)
            } else {
                size = CGSize(width: (frameWidth - (4*inset))/3, height: cellHeight)
            }
        } else {
            size = CGSize(width: (frameWidth - (4*inset))/3, height: cellHeight)
        }
        
        
        return size
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

        return UIEdgeInsets(top: 20, left: 16, bottom: 16, right: 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 15.9
    }
    
    /// Sorts categories within the array in descending order. Saves the first item in UserDefaults as a favouriteCategory. Reloads the collectionView
    func sortCategories() {
        categories.sort { $0.clicks > $1.clicks }
        UserDefaults.standard.set(categories[0].categoryName, forKey: "favouriteCategory")
        collectionView.reloadData()
    }
}

