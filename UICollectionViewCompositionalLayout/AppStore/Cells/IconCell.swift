//
//  IconCell.swift
//  UICollectionViewCompositionalLayout
//
//  Created by Hiep Nguyen on 10/9/19.
//  Copyright © 2019 Hiep Nguyen. All rights reserved.
//

import Foundation
import UIKit

class IconCell: UICollectionViewCell {
    
    static let nibName = "IconCell"
    static let reuseIdentifier = "IconCell"
    
    @IBOutlet weak var getButton: UIButton!
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var gameDesc: UILabel!
    @IBOutlet weak var IAPLabel: UILabel!
    @IBOutlet weak var separator: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        getButton.layer.cornerRadius = getButton.frame.height * 0.5
    }
    
    func setGame(game: Game) {
        iconImage.image = UIImage.init(named: game.iconImageName)
        name.text = game.name
        gameDesc.text = game.description
        IAPLabel.isHidden = game.price != 0
        
        if game.price > 0 {
            getButton.setTitle("$\(game.price)", for: .normal)
        }
    }
    
}
