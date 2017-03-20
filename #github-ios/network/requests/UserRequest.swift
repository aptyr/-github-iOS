//
//  UserRequest.swift
//  #github-ios
//
//  Created by Artur on 14/03/2017.
//  Copyright © 2017 Artur Matusiak. All rights reserved.
//

import Foundation

class UserRequest: HTTPRequest {
    
    private var accessTokenKey: String?
    private var username: String?
    
    init(withAccessTokenKey accessTokenKey: String) {
        self.accessTokenKey = accessTokenKey
    }
    
    init(withUsername username: String) {
        self.username = username
    }
    
    var endpoint: String {
        guard let _ = self.username else { return "/user" }
        
        return "/user/\(self.username!)"
    }
    
    var headers: HTTPRequest.Headers? {
        guard let _ = self.accessTokenKey else { return nil }
        
        return self.tokenHeader(accessTokenKey: self.accessTokenKey!)
    }
    
    var method: NetworkService.Method {
        return .GET
    }
    
    var params: (dict: [String : String], type: HTTPRequestPerformer.ParamsType)? {
        return nil
    }
    
    var url: URL? {
        return URL.githubApiURL(for: self)
    }
}
