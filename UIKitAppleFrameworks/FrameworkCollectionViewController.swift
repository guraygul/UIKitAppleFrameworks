//
//  FrameworkCollectionViewController.swift
//  UIKitAppleFrameworks
//
//  Created by Güray Gül on 3.01.2024.
//

import UIKit

class FrameworkCollectionViewController: UICollectionViewController {
    
    private let reuseIdentifier = "cell"
    
    var frameworks: [Framework] = MockData.frameworks
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    // MARK: UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return frameworks.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! FrameworkCollectionViewCell
        let framework = frameworks[indexPath.row]
        cell.nameLabel.text = framework.name
        cell.imageLabel.image = UIImage(named: framework.imageName)
        // Configure the cell
        
        return cell
    }
}
