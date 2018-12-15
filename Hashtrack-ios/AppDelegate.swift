
//
//  AppDelegate.swift
//  Hashtrack
//
//  Created by Joe Birch on 29/09/2018.
//  Copyright © 2018 hitherejoe. All rights reserved.
//

import UIKit
import Firebase
import Foundation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var navController: UINavigationController?
    var handle: AuthStateDidChangeListenerHandle?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        navController = UINavigationController()
        window = UIWindow(frame: UIScreen.main.bounds)
        self.window!.makeKeyAndVisible()
        //observeAuthorisedState()
        self.setupRootViewController(viewController: navController!)
        self.navController!.pushViewController(HomeViewController(firestore: Firestore.firestore()), animated: false)
        return true
    }
    
    private func observeAuthorisedState() {
        self.setupRootViewController(
            viewController: navController!)
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            if user == nil {
                self.navController!.pushViewController(WelcomeViewController(), animated: false)
            } else {
                self.navController!.pushViewController(HomeViewController(firestore: Firestore.firestore()), animated: false)
            }
        }
    }
    
    private func setupRootViewController(viewController: UIViewController) {
        self.window!.rootViewController = viewController
        self.window!.makeKeyAndVisible()
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        Auth.auth().removeStateDidChangeListener(handle!)
    }
}
