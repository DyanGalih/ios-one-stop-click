//
//  RegisterViewController.swift
//  OSC
//
//  Created by Dyan Galih on 07/05/19.
//  Copyright (c) 2019 Dyan Galih. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol RegisterDisplayLogic: class {
    func displaySuccessRegister()
    func displayRegisterFailed(title: String, message: String)
}

class RegisterViewController: UIViewController, RegisterDisplayLogic {
    @IBOutlet var firstNameTxt: UITextField!
    @IBOutlet var lastNameTxt: UITextField!
    @IBOutlet var emailTxt: UITextField!
    @IBOutlet var pinTxt: UITextField!
    @IBOutlet var pinConfirmationTxt: UITextField!
    @IBOutlet var submitButton: UIButtonActivity!

    var interactor: RegisterBusinessLogic?
    var router: (NSObjectProtocol & RegisterRoutingLogic & RegisterDataPassing)?

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
        let interactor = RegisterInteractor()
        let presenter = RegisterPresenter()
        let router = RegisterRouter()
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

    @IBAction func submitButtonAction(_ sender: UIButton) {
        submitButton.startAnimating()
        let firstName = firstNameTxt.text!
        let lastName = lastNameTxt.text!
        let email = emailTxt.text!
        let pin = pinTxt.text!
        let pinConfirmation = pinConfirmationTxt.text!

        let request = Register.NewUser.Request(firstname: firstName, lastname: lastName, email: email, password: pin, password_confirmation: pinConfirmation)
        interactor?.doRegister(request: request)
    }

    func displayRegisterFailed(title: String, message: String) {
        submitButton.stopAnimating()
        showAlert(title: title, message: message, handler: nil)
    }

    func displaySuccessRegister() {
        submitButton.stopAnimating()
        firstNameTxt.text = ""
        lastNameTxt.text = ""
        emailTxt.text = ""
        pinTxt.text = ""
        pinConfirmationTxt.text = ""
        showAlert(title: "Registration Success", message: "Registration Success Please Login using your account", handler: routeToLogin(_:))
    }
    
    func routeToLogin(_: UIAlertAction) {
        router?.routeToLogin(segue: nil)
    }
}
