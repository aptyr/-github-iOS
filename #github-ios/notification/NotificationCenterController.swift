//
//  NotificationCenterController.swift
//  Air Pollution
//
//  Created by Artur on 04/04/2017.
//  Copyright © 2017 Artur. All rights reserved.
//

import Foundation
import CoreLocation

class NotificationCenterController {
    
    static let shared = NotificationCenterController()
    private init() {}
    
    private static let notificationCenter = NotificationCenter.default
    private static let authURLSchema = Notification.Name(rawValue: "authURLSchema")
    
    class func observeAuthURLSchema(notificationHandler handler: @escaping (Notification) -> Void) {
        notificationCenter.addObserver(forName: authURLSchema, object: nil, queue: nil, using: handler)
    }
    
    class func stopObserveAuthURLSchema(observer: Any) {
        notificationCenter.removeObserver(observer, name: authURLSchema, object: nil)
    }
    
    class func authURLSchemaReceived(url: URL){
        notificationCenter.post(name:authURLSchema, object: url)
    }
}

