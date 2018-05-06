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
    func setTitle(title: String)
    func scrollToPhotoAt(index:Int)
    func reloadData()
}

class PhotoGridViewModel {
    
    weak var photoGridView: PhotoGridView?
    
    //start to fetch the next page of images when we are reaching the end of the list
    private let downloadMorelimit = 5
    private let viewTitle = "Usplash Phots"
    private var photoDetailsViewModel: PhotoDetailsViewModel?
    
    private func downloadNextPage(isFirstStart: Bool = false) {
        
        FeedDowloader.download { (size) in
            
            if isFirstStart {
                
                self.addMorePhotos(currentCount: 0)
            }
          }
    }
    
    func viewDidLoad() {
    
        photoGridView?.setTitle(title: viewTitle)
        downloadNextPage(isFirstStart: true)
    }
    
    func viewDidAppear() {
        
        photoGridView?.reloadData()
        photoGridView?.scrollToPhotoAt(index: photoIndexToScrollTo())
    }
    
    func addMorePhotos(currentCount: Int) {
        
        guard currentCount <  FeedDowloader.photos.count else {
            
            return
        }
        var indexPaths:[IndexPath] = []
        for index in currentCount..<FeedDowloader.photos.count {

                indexPaths.append(IndexPath(item: index, section: 0))
        }
        update(indexPaths: indexPaths)
    }
    
    func update(indexPaths: [IndexPath]) {
        
         photoGridView?.addPhotos(inPaths: indexPaths)
    }

    
    func numberOfPhotos() -> Int {
        
        return FeedDowloader.photos.count
    }
    
    func phtoAt(index: Int) -> Photo? {
        
        if FeedDowloader.photos.count - index < downloadMorelimit {
            
            downloadNextPage()
        }
        
        return FeedDowloader.photos[index]
    }
    
    func photoIndexToScrollTo() -> Int {
        
        return photoDetailsViewModel?.photoIndex ?? 0
    }
    
    func photoDetailsViewModel(atIndex: Int) -> PhotoDetailsViewModel {
        
        if photoDetailsViewModel == nil {
            
             photoDetailsViewModel = PhotoDetailsViewModel()
        }
        photoDetailsViewModel?.photoIndex = atIndex

        //already check for nil
        return photoDetailsViewModel!
    }
}
