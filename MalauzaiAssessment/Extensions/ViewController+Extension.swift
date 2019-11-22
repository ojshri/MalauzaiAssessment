//
//  ViewController+Extension.swift
//  MalauzaiAssessment
//
//  Copyright © 2019 Oj Shrivastava. All rights reserved.
//

import UIKit

extension UIViewController {
    
    /**
     Show alert view in the alert view
     @param title: Title to be displayed in the alert
     @param message: Text to be displayed as message in the alert
     */
    @objc func showAlertWith(title: String, message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Ok",
                                      style: .default,
                                      handler: nil))
        self.present(alert, animated: true)
    }
}
