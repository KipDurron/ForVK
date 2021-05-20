//
//  AppDelegate.swift
//  ForVK
//
//  Created by Илья Кадыров on 16.06.2020.
//  Copyright © 2020 Илья Ишунин. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = LoginFormController()
        window.makeKeyAndVisible()
        self.window = window
        return true
    }

}

