//
//  TradeRev_Code_challengeTests.swift
//  TradeRev Code challengeTests
//
//  Created by David Ma on 2018-05-05.
//  Copyright © 2018 David Ma. All rights reserved.
//

import XCTest

class TradeRev_Code_challengeTests: XCTestCase {
    
    var photoGridViewModel: PhotoGridViewModel!
    var didAddPhotos: Bool!
    var title: String!
    var scrollToPhotoIndex: Int!
    var didReloadData: Bool!
    
    
    override func setUp() {
        
        super.setUp()
        photoGridViewModel = PhotoGridViewModel(downloader: MockFeedDownloader())
        photoGridViewModel.photoGridView = self
        didAddPhotos       = false
        title              = ""
        scrollToPhotoIndex = -1
        didReloadData      = false
    }
    
    override func tearDown() {
       
        super.tearDown()
    }
    
    func testViewDidLoad() {
        
        photoGridViewModel.viewDidLoad()
        validateInitalSetup()
    }
    
    func testLoadMorePhoto() {
        
        photoGridViewModel.viewDidLoad()
       validateInitalSetup()
       _ = photoGridViewModel.photoAt(index: 15)
        XCTAssertEqual(photoGridViewModel.numberOfPhotos(), 40)
    }
    
    func testGetPhoto() {
        
        photoGridViewModel.viewDidLoad()
        validateInitalSetup()
        let photo = photoGridViewModel.photoAt(index: 8)
        XCTAssertEqual(photo?.description, "Photo 0 - 8")
    }
    
    func testScrollToPhotoInDetailsView() {
        
        photoGridViewModel.viewDidLoad()
        validateInitalSetup()
       _ = photoGridViewModel.photoDetailsViewModel(atIndex: 15)
        photoGridViewModel.photoDetailsViewModel?.photoDetailsView = self
        photoGridViewModel.photoDetailsViewModel?.viewDidAppear()
        XCTAssertEqual(scrollToPhotoIndex, 15)
        XCTAssertEqual(photoGridViewModel.photoDetailsViewModel?.titleForPhtoAt(index: 15), "username: 0 - 15")
        
    }
    
    func testScrollToPhotoInDetailsViewAndDismiss() {
        
        photoGridViewModel.viewDidLoad()
        validateInitalSetup()
        _ = photoGridViewModel.photoDetailsViewModel(atIndex: 15)
        photoGridViewModel.photoDetailsViewModel?.photoDetailsView = self
        photoGridViewModel.photoDetailsViewModel?.viewDidAppear()
        XCTAssertEqual(scrollToPhotoIndex, 15)
        XCTAssertEqual(photoGridViewModel.photoDetailsViewModel?.titleForPhtoAt(index: 15), "username: 0 - 15")
        XCTAssertEqual(photoGridViewModel.photoIndexToScrollTo(), 15)
        
    }
    
    private func validateInitalSetup() {
        
        XCTAssertEqual(title, "Usplash Photos")
        XCTAssertTrue(didAddPhotos)
        XCTAssertFalse(didReloadData)
        XCTAssertEqual(scrollToPhotoIndex, -1)
        XCTAssertEqual(photoGridViewModel.numberOfPhotos(), 20)
    }
}

extension TradeRev_Code_challengeTests: PhotoGridView {
    
    
    func addPhotos(inPaths: [IndexPath]) {
        
        didAddPhotos = true
    }
    
    func setTitle(title: String) {
        
        self.title = title
    }
    
    func scrollToPhotoAt(index: Int) {
        
        scrollToPhotoIndex = index
    }
    
    func reloadData() {
        
        didReloadData = true
    }
}

extension TradeRev_Code_challengeTests: PhotoDetailsView {
    
    func setShowPhotoAt(index: Int) {
        
        scrollToPhotoIndex = index
    }
}

