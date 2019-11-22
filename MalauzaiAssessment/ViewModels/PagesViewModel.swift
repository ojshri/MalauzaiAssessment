//
//  PagesViewModel.swift
//  MalauzaiAssessment
//
//  Copyright © 2019 Oj Shrivastava. All rights reserved.
//


import Foundation

/**
 View model for the pages view to display
 */
class PagesViewModel {
    private var photos = [FlickrPhoto]()
    
    var photosCount: Int {
        return photos.count
    }
    
    func setPhotos(photos: [FlickrPhoto]) {
        self.photos = photos
    }
    
    func getPhoto(at index: Int) -> FlickrPhoto? {
        if index < 0 || index > photos.count {
            return nil
        }
        
        return photos[index]
    }
}
