//
//  PhotoDetailsViewController.swift
//  TradeRev Code challenge
//
//  Created by David Ma on 2018-05-05.
//  Copyright © 2018 David Ma. All rights reserved.
//

import UIKit

class PhotoDetailsViewController: UIPageViewController {
    
    var viewModel: PhotoDetailsViewModel?
    fileprivate var cache = Set<PhotoPageViewController>()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor        = .white
        dataSource                  = self
        viewModel?.photoDetailsView = self
        viewModel?.viewDidLoad()
        
        let firstPage   = page()
        let currentPage = viewModel?.photoIndex ?? 0
        firstPage.page  = currentPage
        firstPage.setImage(photo: viewModel?.photoAt(index: currentPage))
        setViewControllers([firstPage], direction: .forward, animated: true, completion: nil)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        viewModel?.viewDidAppear()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        super.viewWillDisappear(animated)
    }
    
    
    fileprivate func page() -> PhotoPageViewController {
        
        guard let vc = cache.filter({ (pvc) -> Bool in return pvc.parent == nil}).first else {
            
            let page = PhotoPageViewController()
            cache.insert(page)
            
            return page
        }
        vc.prepareForReuse()
        return vc
    }
}

// MARK: UIPageViewControllerDelegate
extension PhotoDetailsViewController: UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        if let vc = previousViewControllers.first as? PhotoPageViewController, completed {
            
            viewModel?.photoIndex = vc.page + 1
        }
    }
}


// MARK: UIPageViewControllerDataSource
extension PhotoDetailsViewController: UIPageViewControllerDataSource {
    

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let vc = viewController as? PhotoPageViewController, vc.page > 0 else {
            
            return nil
        }
        let prevPage    = page()
        prevPage.page   = vc.page - 1
        prevPage.setImage(photo: viewModel?.photoAt(index: prevPage.page))
        
        return prevPage
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let vc = viewController as? PhotoPageViewController else {
            
            return nil
        }
        let nextPage  = page()
        nextPage.page = vc.page + 1
        nextPage.setImage(photo: viewModel?.photoAt(index: nextPage.page))
        
        return nextPage
    }
}

// MARK: PhotoDetailsView
extension PhotoDetailsViewController: PhotoDetailsView {
    
    func addPhotos(amount: Int) {}
}

