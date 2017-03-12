//
//  AccessToken.swift
//  #github-ios
//
//  Created by Artur on 09/03/2017.
//  Copyright © 2017 Artur Matusiak. All rights reserved.
//

import Foundation

class AccessToken {
    
    private(set) var accessTokenKey: String?
    private(set) var scope: String?
    private(set) var tokenType: String?
    
    private let params: String
    
    required init(withParams params: String){
       self.params = params
    }
    
}
