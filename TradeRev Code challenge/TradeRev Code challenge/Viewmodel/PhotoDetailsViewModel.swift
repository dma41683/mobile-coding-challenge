//
//  PhotoDetailsViewModel.swift
//  TradeRev Code challenge
//
//  Created by David Ma on 2018-05-06.
//  Copyright © 2018 David Ma. All rights reserved.
//

import UIKit

protocol PhotoDetailsView: class {
    
    func addPhotos(amount: Int)
}

class PhotoDetailsViewModel: PhotoGridViewModel {

    weak var  photoDetailsView: PhotoDetailsView?
    var photoIndex = 0
    
   override func viewDidLoad() {}
    override func viewDidAppear() {}
    
    func titleForPhtoAt(index: Int) -> String? {
        
        return feedDownloader.photos[index].user?.username
    }
    
    override func update(indexPaths: [IndexPath]) {
        
        photoDetailsView?.addPhotos(amount: indexPaths.count)
    }
}
