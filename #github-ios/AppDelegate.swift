//
//  AppDelegate.swift
//  #github-ios
//
//  Created by Artur on 07/03/2017.
//  Copyright © 2017 Artur Matusiak. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: AppServicesDelegate {


    override var services: [AppSerivce] {
        get {
            return [
                FirebaseService(),
                URLSchemaService()
            ]
        }
        
        set {
            self.services = newValue
        }
    }



}

