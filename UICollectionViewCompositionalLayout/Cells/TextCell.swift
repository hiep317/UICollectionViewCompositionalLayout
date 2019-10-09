//
//  TextCell.swift
//  UICollectionViewCompositionalLayout
//
//  Created by Hiep Nguyen on 10/8/19.
//  Copyright © 2019 Hiep Nguyen. All rights reserved.
//

import Foundation
import UIKit

class TextCell: UICollectionViewCell {
    static let nibName = "TextCell"
    static let reuseIdentifier = "TextCell"
    @IBOutlet weak var textLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setText(text: String) {
        textLabel.text = text
    }
}

