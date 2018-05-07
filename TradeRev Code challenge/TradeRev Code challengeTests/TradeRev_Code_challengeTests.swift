//
//  TradeRev_Code_challengeTests.swift
//  TradeRev Code challengeTests
//
//  Created by David Ma on 2018-05-05.
//  Copyright © 2018 David Ma. All rights reserved.
//

import XCTest
//@testable import TradeRev_Code_challenge

class TradeRev_Code_challengeTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
       
        let vm = PhotoGridViewModel(downloader: MockFeedDownloader())
        vm.viewDidLoad()
    }
}
