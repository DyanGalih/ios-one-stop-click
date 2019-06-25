//
//  ForgotPasswordViewController.swift
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

protocol ForgotPasswordDisplayLogic: class {
    func displayMessage(title: String, message: String)
}

class ForgotPasswordViewController: UIViewController, ForgotPasswordDisplayLogic {
    

    var interactor: ForgotPasswordBusinessLogic?
    var router: (NSObjectProtocol & ForgotPasswordRoutingLogic & ForgotPasswordDataPassing)?

    @IBOutlet var emailTxt: UITextField!

    // MARK: Object lifecycle

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    // MARK: Setup

    private func setup() {
        let viewController = self
        let interactor = ForgotPasswordInteractor()
        let presenter = ForgotPasswordPresenter()
        let router = ForgotPasswordRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }

    // MARK: Routing

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }

    // MARK: View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: Do something

    // @IBOutlet weak var nameTextField: UITextField!

    func doReqForgotPassword(email: String) {
        let request = ForgotPassword.Submit.Request(email: email)
        interactor?.doForgotPassword(request: request)
    }

    func displayMessage(title: String, message: String) {
        self.showAlert(title: title, message: message, handler: nil)
    }

    @IBAction func submitBtn(_ sender: UIButton) {
        let email: String = emailTxt.text!
        doReqForgotPassword(email: email)
    }
}
