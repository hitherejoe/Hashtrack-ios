//
//  HomeViewController.swift
//  Hashtrack
//
//  Created by Joe Birch on 29/09/2018.
//  Copyright © 2018 hitherejoe. All rights reserved.
//

import UIKit
import Firebase

class HomeViewController: UITabBarController {
    
    var firestore: Firestore?
    
    init(firestore: Firestore) {
        self.firestore = firestore
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let twitterVC = HashtagViewController(firestore: self.firestore!)
        twitterVC.tabBarItem = UITabBarItem(title: "Twitter", image: UIImage(named: "compass"), tag: 0)
        
        let instagramVC = HashtagViewController(firestore: self.firestore!)
        instagramVC.tabBarItem = UITabBarItem(title: "Instagram", image: UIImage(named: "compass"), tag: 0)
        
        let controllers = [twitterVC, instagramVC]
        self.viewControllers = controllers
        self.viewControllers = controllers.map { UINavigationController(rootViewController: $0)}
    }
    
}
