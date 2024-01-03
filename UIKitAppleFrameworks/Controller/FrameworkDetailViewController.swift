//
//  FrameworkDetailViewController.swift
//  UIKitAppleFrameworks
//
//  Created by Güray Gül on 3.01.2024.
//

import UIKit
import SafariServices

class FrameworkDetailViewController: UIViewController {
    
    var framework: Framework?
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var headerView: FrameworkDetailHeaderView!
    
    @IBAction func openLink(_ sender: Any) {
        if let framework = framework, let url = URL(string: framework.urlString) {
            let safariViewController = SFSafariViewController(url: url)
            present(safariViewController, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = false
        tableView.separatorStyle = .none
        
        if let framework = framework {
            headerView.nameLabel.text = framework.name
            headerView.headerImageView.image = UIImage(named: framework.imageName)
        }
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = false
    }
}

extension FrameworkDetailViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FrameworkDetailTextCell.self), for: indexPath) as! FrameworkDetailTextCell
        
        cell.descriptionLabel.text = framework?.description
        return cell
    }
    
    
    
    
}
