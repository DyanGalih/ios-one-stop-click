//
//  ForgotPasswordView.swift
//  OSC
//
//  Created by Dyan Galih on 26/07/19.
//  Copyright © 2019 Dyan Galih. All rights reserved.
//

import Foundation
import UIKit

class ForgotPasswordView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }

    func setupView() {
        backgroundColor = Asset().backgroundColor
    }
}
