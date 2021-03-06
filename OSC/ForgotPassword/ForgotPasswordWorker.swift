//
//  ForgotPasswordWorker.swift
//  OSC
//
//  Created by Dyan Galih on 14/05/19.
//  Copyright (c) 2019 Dyan Galih. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import Alamofire
import UIKit

class ForgotPasswordWorker {
    func doForgotPassword(request: ForgotPassword.Submit.Request, completion: @escaping (ForgotPassword.Submit.Response?, Error?) -> Void) {
        let parameters = [
            "email": request.email
        ]

        Alamofire.request(Config().endpoint + "/forgot_password", method: .post, parameters: parameters, encoding: JSONEncoding.default).debugLog()
            .responseJSON {
                response in
                do {
                    let forgotPasswordStruct = try JSONDecoder().decode(ForgotPassword.Submit.Response.self, from: response.data!)
                    if forgotPasswordStruct.code == 200 {
                        completion(forgotPasswordStruct, nil)
                    } else {
                        completion(nil, nil)
                    }
                } catch let err {
                    completion(nil, err)
                }
            }
    }
}
