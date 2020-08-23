//
//  MenuTabCollectionView.swift
//  Clone29CM
//
//  Created by 이예슬 on 8/20/20.
//  Copyright © 2020 이예슬. All rights reserved.
//

import UIKit

class MenuTabCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var menuLabel: UILabel!
    var indexPath: IndexPath!
    override var isSelected: Bool {
        didSet {
            menuLabel.font = isSelected ? UIFont.boldSystemFont(ofSize: 15): UIFont.systemFont(ofSize: 15)
            if menuLabel.text != "클린뷰티"{
                menuLabel.textColor = isSelected ? .black:.gray
            }
            
        }
    }
    
    override func awakeFromNib() {

        menuLabel.textColor = .gray
    }
    
    
    
}
