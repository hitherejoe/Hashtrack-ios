//
//  WelcomeViewController.swift
//  Novel-iOS
//
//  Created by Joe Birch on 12/08/2018.
//  Copyright © 2018 Joe Birch. All rights reserved.
//

import Foundation
import UIKit

class WelcomeViewController: UIViewController {
    
    let signUpButton = LoginButton(frame: .zero)
    let signInButton = LoginButton(frame: .zero)
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [signUpButton, signInButton])
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.axis = .vertical
        stackView.spacing = 15.0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        setupView()
    }
    
    func setupView() {
        signUpButton.setTitle("Sign up", for: .normal)
        signInButton.setTitle("Sign in", for: .normal)
        stackView.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
        stackView.isLayoutMarginsRelativeArrangement = true
        view.addSubview(stackView)
        view.addConstraint(NSLayoutConstraint(item: stackView, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: stackView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: stackView, attribute: .width,
                                              relatedBy: .equal,
                                              toItem: nil,
                                              attribute: .notAnAttribute,
                                              multiplier: 1.0,
                                              constant: 250.0))
        
        let signInGesture = UITapGestureRecognizer(target: self, action: #selector(self.signInClicked))
        let signUpGesture = UITapGestureRecognizer(target: self, action: #selector(self.signUpClicked))
        
        signUpButton.addGestureRecognizer(signUpGesture)
        signInButton.addGestureRecognizer(signInGesture)
    }
    
    @objc func signInClicked() {
        let loginController = LoginViewController()
        loginController.loginMode = LoginMode.signIn
        self.navigationController?.pushViewController(loginController, animated: true)
    }
    
    @objc func signUpClicked() {
        let loginController = LoginViewController()
        loginController.loginMode = LoginMode.signUp
        self.navigationController?.pushViewController(loginController, animated: true)
    }
}

