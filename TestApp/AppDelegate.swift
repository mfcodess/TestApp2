//
//  AppDelegate.swift
//  TestApp
//
//  Created by Max on 24.08.2024.
//

import UIKit

@main

class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = TabBarViewController()
        window?.makeKeyAndVisible()
        
        return true
    }
}

