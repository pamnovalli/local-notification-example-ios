//
//  AppDelegate.swift
//  localNotificationExample
//
//  Created by Pamela Ianovalli on 08/03/20.
//  Copyright © 2020 Pamela Ianovalli. All rights reserved.
//

import UIKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    let notification = NotificationCenter()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        notification.notificationCenter.delegate = notification
        
        return true
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        
        UIApplication.shared.applicationIconBadgeNumber = 0
    }
}

