//
//  FeaturedCell.swift
//  UICollectionViewCompositionalLayout
//
//  Created by Hiep Nguyen on 10/9/19.
//  Copyright © 2019 Hiep Nguyen. All rights reserved.
//

import Foundation
import UIKit

class FeaturedCell: UICollectionViewCell {
    
    static let nibName = "FeaturedCell"
    static let reuseIdentifier = "FeaturedCell"
    
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var gameDescLabel: UILabel!
    @IBOutlet weak var posterImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        posterImage.layer.cornerRadius = 10
    }
    
    func setGame(game: Game) {
        statusLabel.text = game.status
        nameLabel.text = game.name
        gameDescLabel.text = game.description
        posterImage.image = UIImage.init(named: game.posterImageName)
    }
    
}
