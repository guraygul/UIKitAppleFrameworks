//
//  FrameworkDetailViewController.swift
//  UIKitAppleFrameworks
//
//  Created by Güray Gül on 3.01.2024.
//

import UIKit

class FrameworkDetailViewController: UIViewController {

    @IBOutlet var frameworkImageView: UIImageView!
    
    var frameworkImageName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        frameworkImageView.image = UIImage(named: frameworkImageName)
    }
}
