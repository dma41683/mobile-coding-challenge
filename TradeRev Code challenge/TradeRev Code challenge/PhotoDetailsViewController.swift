//
//  PhotoDetailsViewController.swift
//  TradeRev Code challenge
//
//  Created by David Ma on 2018-05-05.
//  Copyright © 2018 David Ma. All rights reserved.
//

import UIKit

class PhotoDetailsViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var viewModel: PhotoDetailsViewModel?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        viewModel?.photoDetailsView = self
        viewModel?.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        viewModel?.viewDidAppear()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

//MARK: UICollectionViewDelegate

extension PhotoDetailsViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
    }
    
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0.0
    }
}


// MARK: UICollectionViewDataSorce

extension PhotoDetailsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        
        return  viewModel?.numberOfPhotos() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "detailsCell", for: indexPath) as! PhotoDetailsCollectionViewCell
        
        title = viewModel?.titleForPhtoAt(index: indexPath.row) ?? ""
        cell.setImage(photo: viewModel?.phtoAt(index: indexPath.row))
        viewModel?.addMorePhotos(currentCount: collectionView.numberOfItems(inSection: 0))
        
        
        return cell
    }
}

// MARK: PhotoDetailsView

extension PhotoDetailsViewController: PhotoDetailsView {
    
    func addPhotos(inPaths: [IndexPath]) {
        
        collectionView.performBatchUpdates({
            
            collectionView.insertItems(at: inPaths)
            
        }, completion: nil)
    }
    
    func setShowPhotoAt(index: Int) {
        
        collectionView.scrollToItem(at: IndexPath(item: index, section: 0), at: .right, animated: false)
    }
}

