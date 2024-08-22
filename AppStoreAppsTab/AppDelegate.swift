//
//  AppDelegate.swift
//  AppStoreAppsTab
//
//  Created by vietnd1 on 21/8/24.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let controller = AppsViewController()
        window?.rootViewController = controller
        window?.makeKeyAndVisible()
        return true
    }
    
}

