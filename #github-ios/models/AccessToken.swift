//
//  AccessToken.swift
//  #github-ios
//
//  Created by Artur on 09/03/2017.
//  Copyright © 2017 Artur Matusiak. All rights reserved.
//

import Foundation

class AccessToken: CustomStringConvertible {
    
    private(set) var accessTokenKey: String?
    private(set) var scope: String?
    private(set) var tokenType: String?
    
    private var stringParams: String?
    private var dictionaryParams: [String : String]?
    
    init(withString params: String){
        
        self.stringParams = params
        
        let dictionary = self.dictionary(from: params)
        
        self.accessTokenKey = dictionary["access_token"]
        self.scope = dictionary["scope"]
        self.tokenType = dictionary["token_type"]
    }
    
    init(withDictionary params: [String : String]) {
        
        self.dictionaryParams = params
        
        self.accessTokenKey = params["access_token"]
        self.scope = params["scope"]
        self.tokenType = params["token_type"]
        
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
    
    var description: String {
        return "accessTokenKey: \(self.accessTokenKey), scope: \(self.scope), tokenType: \(self.tokenType)"
    }
}
