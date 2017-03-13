//
//  URLSchemaService.swift
//  #github-ios
//
//  Created by Artur on 13/03/2017.
//  Copyright © 2017 Artur Matusiak. All rights reserved.
//

import Foundation
import UIKit

final class URLSchemaService: NSObject, AppSerivce {
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
               return true

    }
    
}
