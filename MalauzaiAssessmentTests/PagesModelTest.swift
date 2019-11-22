//
//  PagesModelTest.swift
//  MalauzaiAssessment
//
//  Copyright © 2019 Oj Shrivastava. All rights reserved.
//

import XCTest
@testable import MalauzaiAssessment

class PagesModelTest: XCTestCase {
    func testSetPhotos() {
        let pagesViewModel = PagesViewModel()
        pagesViewModel.setPhotos(photos: [
            FlickrPhoto(title: "Sample Title", media: Media(m: "https://www.google.com/some.png"))
        ])
        XCTAssert(pagesViewModel.photosCount == 1, "Improper phtos count")
    }

    func testPhotosCount() {
        let pagesViewModel = PagesViewModel()
        pagesViewModel.setPhotos(photos: [
            FlickrPhoto(title: "Sample Title", media: Media(m: "https://www.google.com/some.png")),
            FlickrPhoto(title: "Sample Title 2", media: Media(m: "https://www.google.com/some2.png"))
        ])
        XCTAssert(pagesViewModel.photosCount == 2, "Improper phtos count")
    }
    
    
    func testGetPhotoAtProperIndex() {
        let pagesViewModel = PagesViewModel()
        pagesViewModel.setPhotos(photos: [
            FlickrPhoto(title: "Sample Title", media: Media(m: "https://www.google.com/some.png")),
            FlickrPhoto(title: "Sample Title 2", media: Media(m: "https://www.google.com/some2.png"))
        ])
        let photo = pagesViewModel.getPhoto(at: 1)
        XCTAssert(photo?.title == "Sample Title 2", "Imporper photo fetched")
    }
    
    func testGetPhotoAtImProperIndex() {
        let pagesViewModel = PagesViewModel()
        pagesViewModel.setPhotos(photos: [
            FlickrPhoto(title: "Sample Title", media: Media(m: "https://www.google.com/some.png")),
            FlickrPhoto(title: "Sample Title 2", media: Media(m: "https://www.google.com/some2.png"))
        ])
        let photo = pagesViewModel.getPhoto(at: -1)
        XCTAssertNil(photo, "It should return nil")
    }
    
    func testGetPhotoAtOutofBoundIndex() {
        let pagesViewModel = PagesViewModel()
        pagesViewModel.setPhotos(photos: [
            FlickrPhoto(title: "Sample Title", media: Media(m: "https://www.google.com/some.png")),
            FlickrPhoto(title: "Sample Title 2", media: Media(m: "https://www.google.com/some2.png"))
        ])
        let photo = pagesViewModel.getPhoto(at: 3)
        XCTAssertNil(photo, "It should return nil")
    }
}
