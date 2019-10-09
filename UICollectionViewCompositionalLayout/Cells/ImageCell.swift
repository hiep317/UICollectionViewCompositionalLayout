//
//  ImageCell.swift
//  UICollectionViewCompositionalLayout
//
//  Created by Hiep Nguyen on 10/8/19.
//  Copyright © 2019 Hiep Nguyen. All rights reserved.
//

import Foundation
import UIKit

class ImageCell: UICollectionViewCell {
    static let nibName = "ImageCell"
    static let reuseIdentifier = "ImageCell"
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var container: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func shadowedCell() {
        container.backgroundColor = UIColor.white
        container.layer.shadowColor = UIColor.black.cgColor
        container.layer.cornerRadius = 20
        container.layer.shadowOpacity = 0.2
        container.layer.shadowRadius = 5
        container.layer.shadowOffset = CGSize(width: 0, height: 0)
        container.translatesAutoresizingMaskIntoConstraints = false
        
        self.contentView.clipsToBounds = false
        self.layer.masksToBounds = false
    }
    
    func setText(text: String) {
        textLabel.text = text
    }
    
    func setImage(image: UIImage?) {
        imageView.image = image
    }
}
