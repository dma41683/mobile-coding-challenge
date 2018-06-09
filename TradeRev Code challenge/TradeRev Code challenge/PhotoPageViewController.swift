//
//  PhotoPageViewController.swift
//  TradeRev Code challenge
//
//  Created by David Ma on 2018-06-09.
//  Copyright © 2018 David Ma. All rights reserved.
//

import UIKit

class PhotoPageViewController: UIViewController {

    
    var page = -1
    fileprivate let imageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        let views = ["image": imageView]
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "|[image]|", options: [], metrics: [:], views: views))
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[image]|", options: [], metrics: [:], views: views))
        
        prepareForReuse()
    }
}

extension PhotoPageViewController {
    
    func prepareForReuse() {
        
        imageView.image = UIImage(named: "placeholder")
    }
    
    func setImage(photo: Photo?) {
        
        photo?.downloadFullSizeImage(completion: { (image) in
            
            UIView.transition(with: self.imageView,
                              duration:1,
                              options: UIViewAnimationOptions.transitionCrossDissolve,
                              animations: { self.imageView.image = image },
                              completion: nil)
        })
    }
}
