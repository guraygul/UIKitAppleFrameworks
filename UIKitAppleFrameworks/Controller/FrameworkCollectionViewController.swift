//
//  FrameworkCollectionViewController.swift
//  UIKitAppleFrameworks
//
//  Created by Güray Gül on 3.01.2024.
//

import UIKit

class FrameworkCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    private let reuseIdentifier = "cell"
    
    var frameworks: [Framework] = MockData.frameworks
    
    private let sectionInsets = UIEdgeInsets(top: 20.0, left: 10.0, bottom: 20.0, right: 10.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        collectionView.dataSource = self
        collectionView.delegate = self
        // Do any additional setup after loading the view.
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let itemsPerRow: CGFloat = 3
        
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    func collectionView(
        _ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return sectionInsets
        }
    
    func collectionView(
        _ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return sectionInsets.left
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showFrameworkDetail" {
            if let indexPath = collectionView.indexPathsForSelectedItems?.first {
                let destinationController = segue.destination as! FrameworkDetailViewController
                destinationController.framework = self.frameworks[indexPath.row]
            }
        }
    }
}
