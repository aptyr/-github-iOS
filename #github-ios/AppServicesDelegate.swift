//
//  AppServicesDelegate.swift
//  #github-ios
//
//  Created by Artur on 13/03/2017.
//  Copyright © 2017 Artur Matusiak. All rights reserved.
//

import UIKit

class AppServicesDelegate: UIResponder, UIApplicationDelegate {
    
    
    public var window: UIWindow?
    
    var services: [AppSerivce] = [AppSerivce]()
    
    public func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        for service in services {
            if let result = service.application?(application, didFinishLaunchingWithOptions: launchOptions), !result {
                return false
            }
        }
        return true
    }
    
    public func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        for service in services {
            if let result = service.application?(app, open: url, options: options), !result {
                return false
            }
        }
        return true
    }
    
}
