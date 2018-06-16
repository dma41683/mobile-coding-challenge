//
//  ThumbnailCollectionViewCell.swift
//  TradeRev Code challenge
//
//  Created by David Ma on 2018-05-05.
//  Copyright © 2018 David Ma. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class ThumbnailCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    private var request: DataRequest?
    
    override func prepareForReuse() {
        
        request?.cancel()
        imageView.image = UIImage(named: "placeholder")
    }
    
    func setImage(photo: Photo?) {
        
        request = photo?.downloadThumbnail(completion: { (image) in
            
            self.imageView.image = image
        })
    }
}
