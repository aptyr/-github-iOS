//
//  LoggedOutState.swift
//  #github-ios
//
//  Created by Artur on 05/04/2017.
//  Copyright © 2017 Artur Matusiak. All rights reserved.
//

import Foundation

class LoggedOutState: LoginState {
    
    var loggedIn: Bool = false

    
    func shouldWebViewBeHidden() -> Bool {
        return false
    }
}
