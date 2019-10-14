//
//  HeaderView.swift
//  UICollectionViewCompositionalLayout
//
//  Created by Hiep Nguyen on 10/10/19.
//  Copyright © 2019 Hiep Nguyen. All rights reserved.
//

import Foundation
import UIKit

class HeaderView: UICollectionReusableView {
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var seeAllButton: UIButton!
    
    static let reuseIdentifier = "HeaderView"

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

}
