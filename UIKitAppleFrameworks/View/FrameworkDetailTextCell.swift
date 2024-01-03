//
//  FrameworkDetailTextCell.swift
//  UIKitAppleFrameworks
//
//  Created by Güray Gül on 3.01.2024.
//

import UIKit

class FrameworkDetailTextCell: UITableViewCell {

    @IBOutlet var descriptionLabel: UILabel! {
        didSet {
            descriptionLabel.numberOfLines = 0
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
