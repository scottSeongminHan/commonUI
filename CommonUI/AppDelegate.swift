//
//  AppDelegate.swift
//  CommonUI
//
//  Created by sungals07 on 2021/09/28.
//

import UIKit
import FLEX

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
//        window = UIWindow()
//        window?.rootViewController = ViewController()
//        window?.makeKeyAndVisible()
        
        // FLEX for UI debugging
        if let theWindow = window {
//            let aTap = UITapGestureRecognizer(target: self, action: #selector(chooseBetweenBluePillOrRedPill(_:)))
            let aTap = UITapGestureRecognizer(target: self, action: #selector(showFlexExplorer(_:)))
            theWindow.addGestureRecognizer(aTap)
            aTap.numberOfTapsRequired = 5
            aTap.numberOfTouchesRequired = 4
        }
        
        return true
    }
    
    @objc func showFlexExplorer(_ tapGesture: UITapGestureRecognizer) {
        if tapGesture.state == UIGestureRecognizer.State.ended {
            if FLEXManager.shared.isHidden {
                FLEXManager.shared.showExplorer()
            }
        }
    }

    // MARK: UISceneSession Lifecycle

//    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
//        // Called when a new scene session is being created.
//        // Use this method to select a configuration to create the new scene with.
//        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
//    }
//
//    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
//        // Called when the user discards a scene session.
//        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//    }

}

