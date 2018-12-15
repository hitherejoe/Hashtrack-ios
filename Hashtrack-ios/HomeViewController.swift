//
//  HomeViewController.swift
//  Hashtrack
//
//  Created by Joe Birch on 29/09/2018.
//  Copyright © 2018 hitherejoe. All rights reserved.
//

import UIKit
import Firebase
import FontAwesome_swift

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
        let twitterController = HashtagViewController(firestore: self.firestore!, network: "twitter")
        twitterController.tabBarItem = UITabBarItem(title: "Twitter", image:
            UIImage.fontAwesomeIcon(name: .twitter, style: .brands, textColor: .black, size: CGSize(width: 36, height: 36)), tag: 0)
        
        let instagramController = HashtagViewController(firestore: self.firestore!, network: "instagram")
        instagramController.tabBarItem = UITabBarItem(title: "Instagram", image: UIImage.fontAwesomeIcon(name: .instagram, style: .brands, textColor: .black, size: CGSize(width: 36, height: 36)), tag: 0)
        
        let controllers = [twitterController, instagramController]
        self.viewControllers = controllers
    }
    
}
