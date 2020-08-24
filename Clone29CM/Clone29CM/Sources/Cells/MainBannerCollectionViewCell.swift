//
//  MainBannerCollectionViewCell.swift
//  Clone29CM
//
//  Created by 이예슬 on 8/19/20.
//  Copyright © 2020 이예슬. All rights reserved.
//

import UIKit

class MainBannerCollectionViewCell: UICollectionViewCell{
    
    //MARK: IBOutlets
    
    @IBOutlet weak var bannerImageView: UIImageView!
    
    override func awakeFromNib() {
        //bannerImageView.image = UIImage(named: bannerImageName!) 
    }
    override func layoutSubviews() {
        self.bannerImageView.translatesAutoresizingMaskIntoConstraints = false
        
    }
}
