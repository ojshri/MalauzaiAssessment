//
//  DisplayViewModel.swift
//  MalauzaiAssessment
//
//  Copyright © 2019 Oj Shrivastava. All rights reserved.
//

import Foundation

/**
 ViewModel for the display screen
 */
class DisplayViewModel {
    var pageIndex = -1
    var titleText: String?
    var imageURL: String?
    
    init(index: Int, title: String?, image: String?) {
        pageIndex = index
        titleText = title
        imageURL = image
    }
}
