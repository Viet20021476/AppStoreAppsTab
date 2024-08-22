//
//  CategoryCell.swift
//  AppStoreAppsTab
//
//  Created by vietnd1 on 22/8/24.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    static let reuseIdentifier = "CategoryCell"
    
    @IBOutlet private weak var iconImageView: UIImageView!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func set(category: Category) {
        self.iconImageView.image = UIImage(named: category.image)
        self.descriptionLabel.text = category.description
    }

}
