//
//  ForgotPasswordPresenter.swift
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

protocol ForgotPasswordPresentationLogic {
    func presentSucessForgotPassword()
    func presentFailedReqForgotPassword()
}

class ForgotPasswordPresenter: ForgotPasswordPresentationLogic {
    weak var viewController: ForgotPasswordDisplayLogic?

    func presentFailedReqForgotPassword() {
        viewController?.displayFailedMessage(message: "Request Reset Password Failed, please contact adminstrator")
    }

    func presentSucessForgotPassword() {
        // let viewModel = ForgotPassword.Submit.ViewModel()
        viewController?.displayMessage(title: "Request Success", message: "Request Reset Password Success, Please Check Your Email")
    }
}
