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
    let inputContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        return view
    }()

    let emailTextView: UITextField = {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.placeholder = "Email"
        field.keyboardType = UIKeyboardType.emailAddress
        return field
    }()

    let submitButton: UIButtonActivity = {
        let button = UIButtonActivity(type: .system)
        button.backgroundColor = Asset().buttonColor
        button.setTitle("Reset", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(ForgotPasswordViewController.submitButton(_:)), for: .touchUpInside)
        return button
    }()

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
        addSubview(inputContainerView)
        setupInputContainerView()

        addSubview(submitButton)
        setupSubmitButton()

        inputContainerView.addSubview(emailTextView)
        setupEmailTextView()
    }

    func setupSubmitButton() {
        submitButton.centerXAnchor.constraint(equalTo: inputContainerView.centerXAnchor).isActive = true
        submitButton.topAnchor.constraint(equalTo: inputContainerView.bottomAnchor, constant: 10).isActive = true
        submitButton.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor).isActive = true
        submitButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }

    func setupEmailTextView() {
        emailTextView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        emailTextView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        emailTextView.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor, constant: -20).isActive = true
        emailTextView.heightAnchor.constraint(equalTo: inputContainerView.heightAnchor, multiplier: 1 / 2).isActive = true
    }

    func setupInputContainerView() {
        inputContainerView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        inputContainerView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        inputContainerView.widthAnchor.constraint(equalTo: widthAnchor, constant: -24).isActive = true
        inputContainerView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}
