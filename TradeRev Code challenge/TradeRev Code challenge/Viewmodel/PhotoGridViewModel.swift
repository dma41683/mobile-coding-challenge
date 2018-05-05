//
//  PhotoGridViewModel.swift
//  TradeRev Code challenge
//
//  Created by David Ma on 2018-05-05.
//  Copyright © 2018 David Ma. All rights reserved.
//

import Foundation


protocol PhotoGridView: class {
    
    func addPhotos(inPaths: [IndexPath])
}

class PhotoGridViewModel {
    
    
    
    
    weak var photoGridView: PhotoGridView?
    
    //start to fetch the next page of images when we are reaching the end of the list
    private let downloadMorelimit = 5
    
    
    private func downloadNextPage() {
        
        FeedDowloader.download { (size) in
            
            guard let photoGridView = self.photoGridView else {
                return
            }
            let start = FeedDowloader.photos.count - size
            var indexPaths:[IndexPath] = []
            for index in start..<FeedDowloader.photos.count {
                
                indexPaths.append(IndexPath(item: index, section: 0))
            }
            photoGridView.addPhotos(inPaths: indexPaths)

        }
    }
    
    func viewDidLoad() {
    
        downloadNextPage()
    }
    
    func numberOfPhotos() -> Int {
        
        return FeedDowloader.photos.count
    }
    
    func phtoAt(index: Int) -> Photo? {
        
        return FeedDowloader.photos[index]
    }
    
    func phtoThumbnailUrlAt(index: Int) -> String? {
        
        if index > FeedDowloader.photos.count - downloadMorelimit {
            
            downloadNextPage()
        }
        
        return FeedDowloader.photos[index].urls?.thumb
    }
}
