//
//  LinkCell.swift
//  UICollectionViewCompositionalLayout
//
//  Created by Hiep Nguyen on 10/9/19.
//  Copyright © 2019 Hiep Nguyen. All rights reserved.
//

import Foundation
import UIKit

class LinkCell: UICollectionViewCell {
    
    static let nibName = "LinkCell"
    static let reuseIdentifier = "LinkCell"
    
    @IBOutlet weak var titleLbl: UILabel!
    
    func setModel(model: Game) {
        titleLbl.text = model.name
    }
    
}
