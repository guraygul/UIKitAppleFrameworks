//
//  FrameworkDetailViewController.swift
//  UIKitAppleFrameworks
//
//  Created by Güray Gül on 3.01.2024.
//

import UIKit

class FrameworkDetailViewController: UIViewController {

    var framework: Framework?
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var headerView: FrameworkDetailHeaderView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = false
        if let framework = framework {
                    headerView.nameLabel.text = framework.name
                    headerView.headerImageView.image = UIImage(named: framework.imageName)
                }
    }
}
