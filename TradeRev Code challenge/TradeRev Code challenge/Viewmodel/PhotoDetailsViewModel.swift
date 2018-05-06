//
//  PhotoDetailsViewModel.swift
//  TradeRev Code challenge
//
//  Created by David Ma on 2018-05-06.
//  Copyright © 2018 David Ma. All rights reserved.
//

import UIKit

protocol PhotoDetailsView: class {
    
    func addPhotos(inPaths: [IndexPath])
    func setShowPhotoAt(index: Int)
}

class PhotoDetailsViewModel: PhotoGridViewModel {

    weak var  photoDetailsView: PhotoDetailsView?
    var photoIndex = 0
        
   override func viewDidLoad() {
        
    }
    
    override func viewDidAppear() {
        
        photoDetailsView?.setShowPhotoAt(index: photoIndex)

        
    }
    func titleForPhtoAt(index: Int) -> String? {
        
        return FeedDowloader.photos[index].user?.username
    }
    
    override func update(indexPaths: [IndexPath]) {
        
        guard let phtoDetailsView = photoDetailsView else {
                
                return
            }
        phtoDetailsView.addPhotos(inPaths: indexPaths)
        
    }
}
