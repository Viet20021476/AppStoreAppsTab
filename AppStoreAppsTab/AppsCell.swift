//
//  AppsCell.swift
//  AppStoreAppsTab
//
//  Created by vietnd1 on 22/8/24.
//

import UIKit

class AppsCell: UICollectionViewCell {
    static let reuseIdentifier = "AppsCell"
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var appNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func set(app: App) {
        self.iconImageView.image = UIImage(named: app.icon)
        self.appNameLabel.text = app.appName
        self.descriptionLabel.text = app.description
    }

}
