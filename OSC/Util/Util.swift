//
//  BaseView.swift
//  OSC
//
//  Created by Dyan Galih on 18/06/19.
//  Copyright © 2019 Dyan Galih. All rights reserved.
//

import UIKit
import Alamofire

class Util{
    func showAlert(title: String, message: String, handler: ((UIAlertAction) -> Void)?) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: handler)
        
        alert.addAction(okAction)
        return alert
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

extension UIViewController{
    func showAlert(title: String, message: String, handler: ((UIAlertAction) -> Void)?){
        let util = Util()
        let alert = util.showAlert(title: title, message: message, handler: handler)
        present(alert, animated: true, completion: nil)
    }
}
