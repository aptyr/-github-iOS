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
    
    
    private let notificationCenter = NotificationCenter.default
    
    private let authURLSchema = Notification.Name(rawValue: "authURLSchema")
   
    
    func observeAuthURLSchema(notificationHandler handler: @escaping (Notification) -> Void) {
        print("observeAuthURLSchema")
        notificationCenter.addObserver(forName: authURLSchema, object: nil, queue: nil, using: handler)
    }
    
    func authURLSchemaReceived(url: URL){
        print("authURLSchemaReceived")
        notificationCenter.post(name:authURLSchema, object: url)
    }
    
   
}

