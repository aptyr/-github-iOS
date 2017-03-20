//
//  AccessToken.swift
//  #github-ios
//
//  Created by Artur on 09/03/2017.
//  Copyright © 2017 Artur Matusiak. All rights reserved.
//

import Foundation

final class AccessToken: HTTPRequestResult {
    
    private(set) var accessTokenKey: String?
    private(set) var scope: String?
    private(set) var tokenType: String?
    
    private var params: [String : String]?
    
    init(withDictionary params: [String : String]) {
        self.params = params
        
        self.accessTokenKey = params["access_token"]
        self.scope = params["scope"]
        self.tokenType = params["token_type"]
        
    }
    
    convenience init(withString params: String){
        self.init(withDictionary: params.dictionary)
    }
    
   convenience init(withApiData data: Data) throws {
        let params = try JSONSerialization.jsonObject(with: data, options: []) as! [String: String]
        self.init(withDictionary: params)
    }
    
}
