//
//  RegistrationView.swift
//  OSC
//
//  Created by Dyan Galih on 30/07/19.
//  Copyright © 2019 Dyan Galih. All rights reserved.
//

import Foundation
import UIKit

class RegisterView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }

    let firstNameTextField: UITextField = {
        let field = UITextField()
        field.placeholder = "First Name"
        field.keyboardType = UIKeyboardType.alphabet
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()

    let firstNameSeparator: UIView = {
        let view = UIView()
        view.backgroundColor = Asset().separatorColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let lastNameTextField: UITextField = {
        let field = UITextField()
        field.placeholder = "Last Name"
        field.keyboardType = UIKeyboardType.alphabet
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()

    let lastNameSeparator: UIView = {
        let view = UIView()
        view.backgroundColor = Asset().separatorColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let emailTextField: UITextField = {
        let field = UITextField()
        field.placeholder = "Email"
        field.keyboardType = UIKeyboardType.emailAddress
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()

    let emailSeparator: UIView = {
        let view = UIView()
        view.backgroundColor = Asset().separatorColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let passwordTextField: UITextField = {
        let field = UITextField()
        field.placeholder = "Password"
        field.isSecureTextEntry = true
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()

    let passwordSeparator: UIView = {
        let view = UIView()
        view.backgroundColor = Asset().separatorColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let reinputPasswordTextField: UITextField = {
        let field = UITextField()
        field.placeholder = "Re Input Password"
        field.isSecureTextEntry = true
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()

    let registerTitleView: UILabel = {
        let label = UILabel()
        label.text = "Register New User"
        label.font = UIFont(name: label.font.fontName, size: 24)
        label.textColor = UIColor.white
        label.textAlignment = NSTextAlignment.center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let inputContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        return view
    }()
    
    let registerButton: UIButtonActivity = {
        let button = UIButtonActivity(type: .system)
        button.backgroundColor = Asset().buttonColor
        button.setTitle("Submit", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(RegisterViewController.submitRegiserButton(_:)), for: .touchUpInside)
        return button
    }()

    func setupView() {
        backgroundColor = Asset().backgroundColor

        /**
         * add subview container
         */
        addSubview(inputContainerView)
        setupInputContainerView()

        /**
         * add sub view Title
         */
        addSubview(registerTitleView)
        setupRegisterTitleLabel()

        /**
         * add subview first name
         */
        inputContainerView.addSubview(firstNameTextField)
        setupFirstNameTextField()

        inputContainerView.addSubview(firstNameSeparator)
        setupFirstNameSeparator()

        /**
         * add subview last name text field
         */
        inputContainerView.addSubview(lastNameTextField)
        setupLastNameTextField()

        inputContainerView.addSubview(lastNameSeparator)
        setupLastNameSeparator()

        /**
         * add subview email
         */
        inputContainerView.addSubview(emailTextField)
        setupEmailTextField()

        inputContainerView.addSubview(emailSeparator)
        setupEmailSeparator()

        /**
         *  add subview password
         */

        inputContainerView.addSubview(passwordTextField)
        setupPasswordTextField()

        inputContainerView.addSubview(passwordSeparator)
        setupPasswordSeparator()

        /**
         * add subview re-input password
         */
        
        inputContainerView.addSubview(reinputPasswordTextField)
        setupReinputPasswordTextField()
        
        addSubview(registerButton)
        setupRegisterButton()
        
    }

    func setupFirstNameTextField() {
        firstNameTextField.topAnchor.constraint(equalTo: inputContainerView.topAnchor).isActive = true
        firstNameTextField.leftAnchor.constraint(equalTo: inputContainerView.leftAnchor, constant: 12).isActive = true
        firstNameTextField.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor).isActive = true
        firstNameTextField.heightAnchor.constraint(equalTo: inputContainerView.heightAnchor, multiplier: 1 / 5).isActive = true
    }

    func setupFirstNameSeparator() {
        firstNameSeparator.topAnchor.constraint(equalTo: firstNameTextField.bottomAnchor).isActive = true
        firstNameSeparator.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor).isActive = true
        firstNameSeparator.leftAnchor.constraint(equalTo: inputContainerView.leftAnchor).isActive = true
        firstNameSeparator.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }

    func setupLastNameTextField() {
        lastNameTextField.topAnchor.constraint(equalTo: firstNameTextField.bottomAnchor).isActive = true
        lastNameTextField.leftAnchor.constraint(equalTo: firstNameTextField.leftAnchor).isActive = true
        lastNameTextField.widthAnchor.constraint(equalTo: firstNameTextField.widthAnchor).isActive = true
        lastNameTextField.heightAnchor.constraint(equalTo: inputContainerView.heightAnchor, multiplier: 1 / 5).isActive = true
    }

    func setupLastNameSeparator() {
        lastNameSeparator.topAnchor.constraint(equalTo: lastNameTextField.bottomAnchor).isActive = true
        lastNameSeparator.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor).isActive = true
        lastNameSeparator.leftAnchor.constraint(equalTo: inputContainerView.leftAnchor).isActive = true
        lastNameSeparator.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }

    func setupEmailTextField() {
        emailTextField.topAnchor.constraint(equalTo: lastNameTextField.bottomAnchor).isActive = true
        emailTextField.leftAnchor.constraint(equalTo: firstNameTextField.leftAnchor).isActive = true
        emailTextField.widthAnchor.constraint(equalTo: firstNameTextField.widthAnchor).isActive = true
        emailTextField.heightAnchor.constraint(equalTo: inputContainerView.heightAnchor, multiplier: 1 / 5).isActive = true
    }

    func setupEmailSeparator() {
        emailSeparator.topAnchor.constraint(equalTo: emailTextField.bottomAnchor).isActive = true
        emailSeparator.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor).isActive = true
        emailSeparator.leftAnchor.constraint(equalTo: inputContainerView.leftAnchor).isActive = true
        emailSeparator.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }

    func setupPasswordTextField() {
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor).isActive = true
        passwordTextField.leftAnchor.constraint(equalTo: firstNameTextField.leftAnchor).isActive = true
        passwordTextField.widthAnchor.constraint(equalTo: firstNameTextField.widthAnchor).isActive = true
        passwordTextField.heightAnchor.constraint(equalTo: inputContainerView.heightAnchor, multiplier: 1 / 5).isActive = true
    }

    func setupPasswordSeparator() {
        passwordSeparator.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor).isActive = true
        passwordSeparator.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor).isActive = true
        passwordSeparator.leftAnchor.constraint(equalTo: inputContainerView.leftAnchor).isActive = true
        passwordSeparator.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    func setupReinputPasswordTextField() {
        reinputPasswordTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor).isActive = true
        reinputPasswordTextField.leftAnchor.constraint(equalTo: firstNameTextField.leftAnchor).isActive = true
        reinputPasswordTextField.widthAnchor.constraint(equalTo: firstNameTextField.widthAnchor).isActive = true
        reinputPasswordTextField.heightAnchor.constraint(equalTo: inputContainerView.heightAnchor, multiplier: 1 / 5).isActive = true
    }

    func setupRegisterTitleLabel() {
        registerTitleView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        registerTitleView.topAnchor.constraint(equalTo: inputContainerView.topAnchor, constant: -50).isActive = true
        registerTitleView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        registerTitleView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }

    func setupInputContainerView() {
        inputContainerView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        inputContainerView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        inputContainerView.widthAnchor.constraint(equalTo: widthAnchor, constant: -24).isActive = true
        inputContainerView.heightAnchor.constraint(equalToConstant: 300).isActive = true
    }
    
    func setupRegisterButton() {
        registerButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        registerButton.topAnchor.constraint(equalTo: inputContainerView.bottomAnchor, constant: 12).isActive = true
        registerButton.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor).isActive = true
        registerButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}
