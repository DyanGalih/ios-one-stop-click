//
//  UIButtonActivity.swift
//  OSC
//
//  Created by Dyan Galih on 28/06/19.
//  Copyright © 2019 Dyan Galih. All rights reserved.
//

import Foundation
import UIKit

class UIButtonActivity: UIButton {
    
    @IBInspectable var indicatorColor : UIColor = .lightGray
    
    private var buttonLabel: String?
    
    private let indicatorTag = 1
    
    func startAnimating() {
        self.isEnabled = false
        
        buttonLabel = self.titleLabel?.text
        self.setTitle("", for: .normal)
        
        let indicator = UIActivityIndicatorView()
        indicator.color = indicatorColor
        indicator.hidesWhenStopped = true
        
        let buttonHeight = self.bounds.size.height
        let buttonWidth = self.bounds.size.width
        indicator.center = CGPoint(x: buttonWidth/2, y: buttonHeight/2)
        indicator.tag = indicatorTag
        
        let scale = max(min((self.frame.size.height - 4) / 21, 2.0), 0.0)
        let transform: CGAffineTransform = CGAffineTransform(scaleX: scale, y: scale)
        indicator.transform = transform
        
        self.addSubview(indicator)
        indicator.startAnimating()
    }
    
    func stopAnimating() {
        self.isEnabled = true
        
        if let titleLabel = buttonLabel {
            self.setTitle(titleLabel, for: .normal)
        }
        
        if let indicator = self.viewWithTag(indicatorTag) as? UIActivityIndicatorView {
            indicator.stopAnimating()
            indicator.removeFromSuperview()
        }
    }
}
