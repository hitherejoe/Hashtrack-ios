//
//  LoginTextFIeld.swift
//  Novel-iOS
//
//  Created by Joe Birch on 03/08/2018.
//  Copyright © 2018 Joe Birch. All rights reserved.
//

import UIKit
import QuartzCore

class LoginTextField: UITextField {
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        configureUI()
    }
    
    required override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    func configureUI() {
        self.layer.borderColor = UIColor.gray.cgColor
        self.layer.borderWidth = 0.5
        self.layer.cornerRadius = 4.0
        self.textColor = UIColor.black
        self.borderStyle = UITextField.BorderStyle.roundedRect
        self.clearsOnBeginEditing = true
        self.translatesAutoresizingMaskIntoConstraints = false
        
        let heightConstraint = NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 40)
        self.addConstraint(heightConstraint)
    }
}

