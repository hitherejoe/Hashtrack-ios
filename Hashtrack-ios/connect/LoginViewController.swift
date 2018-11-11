//
//  LoginViewController.swift
//  Hashtrack-ios
//
//  Created by Joe Birch on 11/11/2018.
//  Copyright © 2018 hitherejoe. All rights reserved.
//

import Foundation
import FirebaseAuth

class LoginViewController: UIViewController {
    
    let emailField = LoginTextField(frame: .zero)
    let passwordField = LoginTextField(frame: .zero)
    let authenticateButton = LoginButton(frame: .zero)
    var loginMode: LoginMode = LoginMode.signIn
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [emailField, passwordField, authenticateButton])
        stackView.alignment = .bottom
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
        emailField.placeholder = "Enter email address"
        if (loginMode == LoginMode.signUp) {
            authenticateButton.setTitle("Sign up", for: .normal)
        } else {
            authenticateButton.setTitle("Sign in", for: .normal)
        }
        
        passwordField.isSecureTextEntry = true
        view.addSubview(stackView)
        
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(self.buttonClicked))
        
        authenticateButton.addGestureRecognizer(gesture)
    }
    
    @objc func buttonClicked() {
        
        if (emailField.text?.isEmpty)! {
            let alertController = UIAlertController(title: "Oops", message:
                "Please enter a valid email address", preferredStyle: UIAlertController.Style.alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.default,handler: nil))
            
            self.present(alertController, animated: true, completion: nil)
        } else if (passwordField.text?.isEmpty)! {
            let alertController = UIAlertController(title: "Oops", message:
                "Please enter a password", preferredStyle: UIAlertController.Style.alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.default,handler: nil))
            
            self.present(alertController, animated: true, completion: nil)
        } else {
            if (loginMode == LoginMode.signUp) {
                Auth.auth().signIn(withEmail: emailField.text!, password: passwordField.text!) { (user, error) in
                    
                }
            } else {
                Auth.auth().createUser(withEmail: emailField.text!, password: passwordField.text!) { (user, error) in
                    
                }
            }
        }
    }
    
}

