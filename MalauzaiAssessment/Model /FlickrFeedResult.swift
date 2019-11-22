//
//  FlickrFeedResult.swift
//  MalauzaiAssessment
//
//  Copyright © 2019 Oj Shrivastava. All rights reserved.
//

import Foundation

/**
 Modal to hold the feed details.
 Inherits from Codable to parse the data accordingly
 */
struct FlickrFeedResult: Codable {
    let items: [FlickrPhoto]
}

