//
//  ForgotPasswordModels.swift
//  OSC
//
//  Created by Dyan Galih on 14/05/19.
//  Copyright (c) 2019 Dyan Galih. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum ForgotPassword {
    // MARK: Use cases

    enum Submit {
        struct Request {
            var email: String

            init(email: String) {
                self.email = email
            }
        }

        struct Response: Decodable {
            var code: Int32
            var data: [String]
            var message: String
        }

        struct ViewModel {}
    }
}
