//
//  ForgotPasswordInteractor.swift
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

protocol ForgotPasswordBusinessLogic
{
    func doForgotPassword(request: ForgotPassword.Forgot.Request)
}

protocol ForgotPasswordDataStore
{
    //var name: String { get set }
}

class ForgotPasswordInteractor: ForgotPasswordBusinessLogic, ForgotPasswordDataStore
{
    var presenter: ForgotPasswordPresentationLogic?
    var worker: ForgotPasswordWorker?
    //var name: String = ""
    
    // MARK: Do something
    
    func doForgotPassword(request: ForgotPassword.Forgot.Request)
    {
        worker = ForgotPasswordWorker()
        worker?.doForgotPassword(request: request, completion: { (data, err) in
            if data != nil{
                self.presenter?.presentSucessForgotPassword()
            }else{
                self.presenter?.presentFailedReqForgotPassword()
            }
        })
    }
}