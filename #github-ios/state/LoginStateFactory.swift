//
//  LoginStateFactory.swift
//  #github-ios
//
//  Created by Artur on 05/04/2017.
//  Copyright © 2017 Artur Matusiak. All rights reserved.
//

import Foundation

class LoginStateFactory {
    
    class func getLoginState(hasAccessTokenKey available: Bool) -> LoginState {
        
        return available ? LoggedInState() : LoggedOutState()
        
    }
    
}
