//
//  Secure.swift
//  #github-ios
//
//  Created by Artur on 05/04/2017.
//  Copyright © 2017 Artur Matusiak. All rights reserved.
//

import Foundation
import Locksmith

enum SecureError: Error {
    case NoAccessTokenKey
}

class Secure {
    
    class func token(forUser name: String) -> String? {
        return Locksmith.loadDataForUserAccount(userAccount: name)?["token"] as? String
    }
    
    
    class func store(accessToken: AccessToken, forUser name: String) throws {
        if let accessTokenKey = accessToken.accessTokenKey {
            try Locksmith.saveData(data: ["token": accessTokenKey], forUserAccount: name)
        } else {
            throw SecureError.NoAccessTokenKey
        }
    }
    
    
}
