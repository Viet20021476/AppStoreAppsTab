//
//  BannerCell.swift
//  AppStoreAppsTab
//
//  Created by vietnd1 on 22/8/24.
//

import UIKit

class BannerCell: UICollectionViewCell {
    static let reuseIdentifier = "BannerCell"
    
    @IBOutlet private weak var firstDescriptionLabel: UILabel!
    @IBOutlet private weak var secondDescriptionLabel: UILabel!
    @IBOutlet private weak var thirdDescriptionLabel: UILabel!
    @IBOutlet private weak var bannerImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func set(banner: Banner) {
        self.firstDescriptionLabel.text = banner.firstDes
        self.secondDescriptionLabel.text = banner.secondDes
        self.thirdDescriptionLabel.text = banner.thirdDes
        self.bannerImageView.image = UIImage(named: banner.image)
    }

}
