//
//  RegisterUserRequest.swift
//  #github-ios
//
//  Created by Artur on 14/03/2017.
//  Copyright © 2017 Artur Matusiak. All rights reserved.
//

import Foundation
import Firebase

final class RegisterUserRequest: Request {
  
    private let email: String
    private let accessTokenKey: String
    
    init(email: String, accessTokenKey: String) {
        self.accessTokenKey = accessTokenKey
        self.email = email
    }
     
    func perform(success: ((AnyObject?) -> Void)?, failure: ((Error) -> Void)?) {
        FIRAuth.auth()?.createUser(withEmail: self.email, password: self.accessTokenKey, completion: { (user, error) in
            if let _ = error {
                failure?(error!)
            } else {
                success?(user)
            }
            
        })
    }
    
}
