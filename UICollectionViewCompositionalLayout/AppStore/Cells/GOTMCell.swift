//
//  GOTMCell.swift
//  UICollectionViewCompositionalLayout
//
//  Created by Hiep Nguyen on 10/9/19.
//  Copyright © 2019 Hiep Nguyen. All rights reserved.
//

import Foundation
import UIKit

class GOTMCell: UICollectionViewCell {
    
    static let nibName = "GOTMCell"
    static let reuseIdentifier = "GOTMCell"
    
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    
    func setModel(model: Game) {
        posterImage.image = UIImage.init(named: model.posterImageName)
        titleLbl.text = model.name
    }
    
}
