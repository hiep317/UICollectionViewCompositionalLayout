//
//  TopCategoryCell.swift
//  UICollectionViewCompositionalLayout
//
//  Created by Hiep Nguyen on 10/9/19.
//  Copyright © 2019 Hiep Nguyen. All rights reserved.
//

import Foundation
import UIKit

class TopCategoryCell: UICollectionViewCell {
    
    static let nibName = "TopCategoryCell"
    static let reuseIdentifier = "TopCategoryCell"
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var iconImg: UIImageView!
    
    func setCategory(game: Game) {
        titleLbl.text = game.category
        iconImg.image = UIImage.init(named: game.iconImageName)
    }
    
}
