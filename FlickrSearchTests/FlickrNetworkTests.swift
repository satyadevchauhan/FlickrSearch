//
//  FlickrNetworkTests.swift
//  FlickrSearchTests
//
//  Created by Satyadev on 01/10/18.
//  Copyright © 2018 Satyadev Chauhan. All rights reserved.
//

import XCTest

class FlickrNetworkTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testSearchValidText() {
        
        let expct = expectation(description: "Returns json response")
        
        FlickrSearchService().request("dogs", pageNo: 1) { (result) in
            
            switch result {
            case .Success(let results):
                if results != nil {
                    XCTAssert(true, "Success")
                    expct.fulfill()
                } else {
                    XCTFail("No results")
                }
            case .Failure(let message):
                XCTFail(message)
            case .Error(let error):
                XCTFail(error)
            }
        }
        
        waitForExpectations(timeout: 10) { (error) in
            if let error = error {
                XCTFail("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func testValidatePhotoImageURL() {
        
        let expct = expectation(description: "Returns all fields to create valid image url")
        
        FlickrSearchService().request("dogs", pageNo: 1) { (result) in
            
            switch result {
            case .Success(let results):
                
                guard let photosCount = results?.photo.count else {
                    XCTFail("No photos returned")
                    return
                }
                
                if photosCount > 0 {
                    XCTAssert(true, "Returned photos")
                    
                    // Pick first photo to test image url
                    let photo = results?.photo.first
                    
                    if photo?.farm == nil {
                        XCTFail("No farm id returned")
                    }
                    
                    if photo?.server == nil {
                        XCTFail("No server id returned")
                    }
                    
                    if photo?.id == nil {
                        XCTFail("No photo id returned")
                    }
                    
                    if photo?.secret == nil {
                        XCTFail("No secret id returned")
                    }
                    
                    XCTAssert(true, "Success")
                    expct.fulfill()
                }
            case .Failure(let message):
                XCTFail(message)
            case .Error(let error):
                XCTFail(error)
            }
        }
        
        waitForExpectations(timeout: 10) { (error) in
            if let error = error {
                XCTFail("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func testSearchInvalidText() {
        
        let expct = expectation(description: "Returns error message")
        
        FlickrSearchService().request("", pageNo: 1) { (result) in
            switch result {
            case .Success( _):
                XCTFail("No results")
            case .Failure( _):
                XCTAssert(true, "Success")
                expct.fulfill()
            case .Error( _):
                XCTAssert(true, "Success")
                expct.fulfill()
            }
        }
        
        waitForExpectations(timeout: 10) { (error) in
            if let error = error {
                XCTFail("Error: \(error.localizedDescription)")
            }
        }
    }
    
}
