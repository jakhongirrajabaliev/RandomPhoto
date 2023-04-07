//
//  AppDelegate.swift
//  Unspalsh
//
//  Created by user1 on 16/10/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
     
        let tabbar = MainTBC()
        window?.rootViewController = tabbar
        window?.makeKeyAndVisible()
        return true
    }



}

