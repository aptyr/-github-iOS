//
//  NetworkService.swift
//  #github-ios
//
//  Created by Artur on 14/03/2017.
//  Copyright © 2017 Artur Matusiak. All rights reserved.
//

import Foundation

class NetworkService {
    
    enum Method: String {
        case POST, GET
    }
    
    func request<T>(for request: Request, success: ((T?) -> Void)?, failure: ((Error) -> Void)?) {
        request.perform(success: {
            if let obj = $0 {
                success?(obj as? T)
            } else {
                success?(nil)
            }
        }, failure: { failure?($0) })
    }
}
