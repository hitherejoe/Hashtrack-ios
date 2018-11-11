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
        let twitterController = HashtagViewController(firestore: self.firestore!)
        twitterController.tabBarItem = UITabBarItem(title: "Twitter", image: UIImage(named: "twitter"), tag: 0)
        
        let instagramController = HashtagViewController(firestore: self.firestore!)
        instagramController.tabBarItem = UITabBarItem(title: "Instagram", image: UIImage(named: "compass"), tag: 0)
        
        let controllers = [twitterController, instagramController]
        self.viewControllers = controllers
        self.viewControllers = controllers.map { UINavigationController(rootViewController: $0)}
    }
    
}
