//
//  FlickrPhoto.swift
//  MalauzaiAssessment
//
//  Copyright © 2019 Oj Shrivastava. All rights reserved.
//

import UIKit

/**
 Media modal that is part of the Flickr data to hold the URL of the image
 */
struct Media: Codable {
    let m: String
}

/**
 FlickrPhoto model that is part of the Flickr data to hold the title and media details of the photo
 */
struct FlickrPhoto: Codable {
    let title: String?
    let media: Media?
}
