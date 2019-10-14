//
//  FooterView.swift
//  UICollectionViewCompositionalLayout
//
//  Created by Hiep Nguyen on 10/10/19.
//  Copyright © 2019 Hiep Nguyen. All rights reserved.
//

import Foundation
import UIKit

class FooterView: UICollectionReusableView {
    
    static let reuseIdentifier = "FooterView"
    
    @IBOutlet weak var redeemBtn: UIButton!
    @IBOutlet weak var sendGiftBtn: UIButton!
    @IBOutlet weak var addFundBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        redeemBtn.layer.cornerRadius = 10
        sendGiftBtn.layer.cornerRadius = 10
        addFundBtn.layer.cornerRadius = 10
    }
}
