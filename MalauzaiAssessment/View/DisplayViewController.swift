//
//  DisplayViewController.swift
//  MalauzaiAssessment
//
//  Copyright © 2019 Oj Shrivastava. All rights reserved.
//

import UIKit

class DisplayViewController: UIViewController {
    var displayModel: DisplayViewModel?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var pageIndex: Int {
        guard let dispModel = displayModel else {
            return -1
        }
        return dispModel.pageIndex
    }
    
    /**
     Lifecycle method that will be called on loading the view.
     Here we'll load the default image with loading indicator. Once the image is downloaded, it will be displayed. This is achieved using SDWebImage framework.
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        if let model = displayModel,
            let txt = model.titleText {
            titleLabel.text = txt
        }
        
        imageView.sd_imageIndicator = SDWebImageActivityIndicator.gray
        if let model = displayModel,
            let img = model.imageURL,
            let imgURL = URL(string: img)
        {
            imageView.sd_setImage(with: imgURL,
                                  placeholderImage: UIImage(named: "placeholder"),
                                  completed: nil)
        }
    }
}
