//
//  ViewController.swift
//  TradeRev Code challenge
//
//  Created by David Ma on 2018-05-05.
//  Copyright © 2018 David Ma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    fileprivate let viewModel = PhotoGridViewModel()
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        viewModel.photoGridView = self
    }

    override func viewDidLoad() {
        
        super.viewDidLoad()
        viewModel.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

//MARK: UICollectionViewDelegate

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                                 layout collectionViewLayout: UICollectionViewLayout,
                                 sizeForItemAt indexPath: IndexPath) -> CGSize {
        
            let size = collectionView.frame.size.width / 3 - 3.0
        
            return CGSize(width: size, height: size)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 2.0, left: 2.0, bottom: 2.0, right: 2.0)
    }
    
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 1.0
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 2.0
    }
}


// MARK: UICollectionViewDataSorce

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return viewModel.numberOfPhotos()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let thumbnailCell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCell", for: indexPath) as! ThumbnailCollectionViewCell
        
        thumbnailCell.setImage(url: viewModel.phtoThumbnailUrlAt(index: indexPath.row))
        return thumbnailCell
    }
}

// MARK: PhotoGridView

extension ViewController: PhotoGridView {
    
    func addPhotos(inPaths: [IndexPath]) {
        
        collectionView.performBatchUpdates({
            
            collectionView.insertItems(at: inPaths)

        }, completion: nil)
        

    }
}


