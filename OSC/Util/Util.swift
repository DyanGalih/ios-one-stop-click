//
//  BaseView.swift
//  OSC
//
//  Created by Dyan Galih on 18/06/19.
//  Copyright © 2019 Dyan Galih. All rights reserved.
//

import Alamofire
import UIKit

class Util {
    func showSimpleAlert(title: String, message: String, handler: ((UIAlertAction) -> Void)? = nil) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)

        let okAction = UIAlertAction(title: "Ok", style: .default, handler: handler)

        alert.addAction(okAction)
        return alert
    }
    
    func numberFormat(number: Int32) -> String {
        let formater = NumberFormatter()
        formater.groupingSeparator = "."
        formater.numberStyle = .decimal
        return formater.string(from: NSNumber(value: number))!
    }
}

extension Request {
    public func debugLog() -> Self {
        #if DEBUG
        debugPrint(self)
        #endif
        return self
    }
}

extension UIViewController {
    func showAlert(title: String, message: String, handler: ((UIAlertAction) -> Void)? = nil) {
        let util = Util()
        let alert = util.showSimpleAlert(title: title, message: message, handler: handler)
        present(alert, animated: true, completion: nil)
    }

    func imageRatio(image: UIImage) -> UIImage {
        let size = CGSize(width: 100.0, height: 100.0)
        return image.af_imageScaled(to: size)
    }
}


