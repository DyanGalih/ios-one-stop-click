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
    func displayFailedMessage(message: String)
}

class ForgotPasswordViewController: UIViewController, ForgotPasswordDisplayLogic {
    var interactor: ForgotPasswordBusinessLogic?
    var router: (NSObjectProtocol & ForgotPasswordRoutingLogic & ForgotPasswordDataPassing)?
    var forgotPasswordView: ForgotPasswordView!

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

    private func setupView(){
        self.forgotPasswordView = ForgotPasswordView(frame: self.view.frame)
        self.forgotPasswordView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(self.forgotPasswordView)
        setupForgotPasswordView()
    }

    private func setupForgotPasswordView(){
        self.forgotPasswordView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        self.forgotPasswordView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        self.forgotPasswordView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        self.forgotPasswordView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
    }

    // MARK: Routing

    override func prepare(for segue: UIStoryboardSegue, sender _: Any?) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    private func backToPrev(_: UIAlertAction) {
        navigationController?.popToRootViewController(animated: true)
    }

    func doReqForgotPassword(email: String) {
        let request = ForgotPassword.Submit.Request(email: email)
        interactor?.doForgotPassword(request: request)
    }

    func displayFailedMessage(message: String) {
        forgotPasswordView.submitButton.stopAnimating()
        showAlert(title: "Forgot Password Failed", message: message, handler: nil)
    }

    func displayMessage(title: String, message: String) {
        forgotPasswordView.emailTextView.text = ""
        forgotPasswordView.submitButton.stopAnimating()
        showAlert(title: title, message: message, handler: backToPrev(_:))
    }

    @objc func submitButton(_: UIButtonActivity){
        forgotPasswordView.submitButton.stopAnimating()
        let email: String = forgotPasswordView.emailTextView.text!
        doReqForgotPassword(email: email)
    }
}
