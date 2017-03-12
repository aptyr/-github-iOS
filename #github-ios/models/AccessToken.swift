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
        
        let dictionary = self.dictionary(from: self.params)
        
        self.accessTokenKey = dictionary["access_token"]
        self.scope = dictionary["scope"]
        self.tokenType = dictionary["token_type"]
    }
    
    private func dictionary(from: String) -> [String : String] {
        
        let separated1 = from.components(separatedBy: "&")

        let separated2 = separated1.map {
                $0.components(separatedBy: "=")
            }
        
        let filtered = separated2.filter {
                $0.count == 2
            }
        
        let map = filtered.map {
                [$0[0] : $0[1]]
            }
        
        let flatMap = map.flatMap { $0 }
        
        let reduced = flatMap.reduce([String : String]()) {
                (res, tuple) -> [String : String] in
                var dict = res
                dict.updateValue(tuple.1, forKey: tuple.0)
                return dict
            }
        
        return reduced
    }
}
