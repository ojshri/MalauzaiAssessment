//
//  FlickrServiceManagerTest.swift
//  MalauzaiAssessment
//
//  Copyright © 2019 Oj Shrivastava. All rights reserved.
//

import XCTest
@testable import MalauzaiAssessment

class FlickrServiceManagerTest: XCTestCase {
    func testFlickrWebService() {
        let expectation = XCTestExpectation(description: "Download Flickr photos")
        FlickrServiceManager.manager.getFlickrFeed(from: Constants.flickrURL.rawValue) { flickrResult in
            switch flickrResult {
            case .success(let receivedResult):
                XCTAssertTrue(receivedResult.items.count > 0, "No photos received")
                expectation.fulfill()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        wait(for: [expectation], timeout: 5.0)
    }

    func testImproperFlickrWebService() {
        let expectation = XCTestExpectation(description: "Download Flickr photos")
        FlickrServiceManager.manager.getFlickrFeed(from: "https://www.google.com/") { flickrResult in
            switch flickrResult {
            case .success(_):
                print("Not expected here to receive the photos")
            case .failure(let error):
                XCTAssertNotNil(error)
                print(error.localizedDescription)
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 5.0)
    }
}
