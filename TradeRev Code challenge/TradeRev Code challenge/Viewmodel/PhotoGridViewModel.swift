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
    private let downloadMorelimit = 10
    private let viewTitle = "Usplash Photos"
    
    var photoDetailsViewModel: PhotoDetailsViewModel?
    
    let feedDownloader: FeedDownloader
    
    init(downloader: FeedDownloader = FeedDownloader()) {
        
        feedDownloader = downloader
    }
    
    private func downloadNextPage(isFirstStart: Bool = false) {
        
        feedDownloader.download { (size) in
            
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
        
        guard currentCount <  feedDownloader.photos.count else {
            
            return
        }
        var indexPaths:[IndexPath] = []
        for index in currentCount..<feedDownloader.photos.count {

                indexPaths.append(IndexPath(item: index, section: 0))
        }
        update(indexPaths: indexPaths)
    }
    
    func update(indexPaths: [IndexPath]) {
        
         photoGridView?.addPhotos(inPaths: indexPaths)
    }

    
    func numberOfPhotos() -> Int {
        
        return feedDownloader.photos.count
    }
    
    func phtoAt(index: Int) -> Photo? {
        
        if feedDownloader.photos.count - index < downloadMorelimit {
            
            downloadNextPage()
        }
        
        return feedDownloader.photos[index]
    }
    
    func photoIndexToScrollTo() -> Int {
        
        return photoDetailsViewModel?.photoIndex ?? 0
    }
    
    func photoDetailsViewModel(atIndex: Int) -> PhotoDetailsViewModel {
        
        if photoDetailsViewModel == nil {
            
             photoDetailsViewModel = PhotoDetailsViewModel(downloader: feedDownloader)
        }
        photoDetailsViewModel?.photoIndex = atIndex

        //already check for nil
        return photoDetailsViewModel!
    }
}
