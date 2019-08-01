//
//  LoginView.swift
//  OSC
//
//  Created by Dyan Galih on 28/06/19.
//  Copyright © 2019 Dyan Galih. All rights reserved.
//

import Foundation
import UIKit

class LoginView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    let inputContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        return view
    }()
    
    let loginButton: UIButtonActivity = {
        let button = UIButtonActivity(type: .system)
        button.backgroundColor = Asset().buttonColor
        button.setTitle("Login", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(LoginViewController.loginButtonAction(sender:)), for: .touchUpInside)
        return button
    }()
    
    let registerButton: UIButtonActivity = {
        let button = UIButtonActivity(type: .system)
        button.backgroundColor = Asset().buttonColor
        button.setTitle("Register", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(LoginViewController.registerButtonAction(sender:)), for: .touchUpInside)
        return button
    }()
    
    let forgotPasswordButton: UIButtonActivity = {
        let button = UIButtonActivity(type: .system)
        button.backgroundColor = Asset().buttonColor
        button.setTitle("Forgot Password", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(LoginViewController.forgotPasswordButtonAction(sender:)), for: .touchUpInside)
        return button
    }()
    
    let emailTextField: UITextField = {
        let field = UITextField()
        field.placeholder = "Email"
        field.translatesAutoresizingMaskIntoConstraints = false
        field.keyboardType = UIKeyboardType.emailAddress
        return field
    }()
    
    let passwordTextField: UITextField = {
        let field = UITextField()
        field.placeholder = "Password"
        field.translatesAutoresizingMaskIntoConstraints = false
        field.isSecureTextEntry = true
        return field
    }()
    
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = Asset().separatorColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    func setup() {
        backgroundColor = Asset().backgroundColor
        addSubview(inputContainerView)
        setupInputsContainerView()
        
        addSubview(loginButton)
        setupLoginButton()
        
        addSubview(registerButton)
        setupRegisterButton()
        
        addSubview(forgotPasswordButton)
        setupForgotPassword()
        
        inputContainerView.addSubview(emailTextField)
        setupEmailTextField()
        
        inputContainerView.addSubview(separatorView)
        setupSeparatorView()
        
        inputContainerView.addSubview(passwordTextField)
        setupPasswordTextField()
    }
    
    func setupForgotPassword() {
        forgotPasswordButton.topAnchor.constraint(equalTo: registerButton.bottomAnchor, constant: 12).isActive = true
        forgotPasswordButton.leftAnchor.constraint(equalTo: registerButton.leftAnchor).isActive = true
        forgotPasswordButton.widthAnchor.constraint(equalTo: registerButton.widthAnchor).isActive = true
        forgotPasswordButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setupRegisterButton() {
        registerButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 12).isActive = true
        registerButton.leftAnchor.constraint(equalTo: loginButton.leftAnchor).isActive = true
        registerButton.widthAnchor.constraint(equalTo: loginButton.widthAnchor).isActive = true
        registerButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setupSeparatorView() {
        separatorView.topAnchor.constraint(equalTo: emailTextField.bottomAnchor).isActive = true
        separatorView.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor).isActive = true
        separatorView.leftAnchor.constraint(equalTo: inputContainerView.leftAnchor).isActive = true
        separatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    func setupEmailTextField() {
        emailTextField.topAnchor.constraint(equalTo: inputContainerView.topAnchor).isActive = true
        emailTextField.leftAnchor.constraint(equalTo: inputContainerView.leftAnchor, constant: 12).isActive = true
        emailTextField.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor).isActive = true
        emailTextField.heightAnchor.constraint(equalTo: inputContainerView.heightAnchor, multiplier: 1 / 2).isActive = true
    }
    
    func setupPasswordTextField() {
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor).isActive = true
        passwordTextField.leftAnchor.constraint(equalTo: emailTextField.leftAnchor).isActive = true
        passwordTextField.widthAnchor.constraint(equalTo: emailTextField.widthAnchor).isActive = true
        passwordTextField.heightAnchor.constraint(equalTo: emailTextField.heightAnchor).isActive = true
    }
    
    func setupInputsContainerView() {
        inputContainerView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        inputContainerView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -100).isActive = true
        inputContainerView.widthAnchor.constraint(equalTo: widthAnchor, constant: -24).isActive = true
        inputContainerView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    func setupLoginButton() {
        loginButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        loginButton.topAnchor.constraint(equalTo: inputContainerView.bottomAnchor, constant: 12).isActive = true
        loginButton.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
