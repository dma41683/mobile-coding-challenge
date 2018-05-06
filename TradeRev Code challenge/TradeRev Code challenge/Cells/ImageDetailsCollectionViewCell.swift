//
//  ImageDetailsCollectionViewCell.swift
//  TradeRev Code challenge
//
//  Created by David Ma on 2018-05-05.
//  Copyright © 2018 David Ma. All rights reserved.
//

import UIKit

class ImageDetailsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func prepareForReuse() {
        
        nameLabel.text        = ""
        descriptionLabel.text = ""
        imageView.image       = UIImage(named: "placeholder")
    }
    
    func setImage(photo: Photo?) {
        
        if let name = photo?.user?.name {
            
            nameLabel.text = "By: \(name)"
        }

        var info = ""
        if let likes = photo?.likes {
            
            info = "Likes: \(likes)\n"
        }
        if let description = photo?.description {
            
            info = "\(info)\(description)"
        }
        descriptionLabel.text = info
        
        photo?.downloadFullSizeImage(completion: { (image) in
            
            self.imageView.image = image
        })
    }
}
