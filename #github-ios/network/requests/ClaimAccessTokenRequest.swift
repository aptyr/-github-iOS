//
//  ClaimAccessToken.swift
//  #github-ios
//
//  Created by Artur on 14/03/2017.
//  Copyright © 2017 Artur Matusiak. All rights reserved.
//

import Foundation

final class ClaimAccessTokenRequest: HTTPRequest {
    
    private let clientID: String
    private let clientSecret: String
    private let code: String
    
    init(clientID: String, clientSecret: String, code: String) {
        self.clientID = clientID
        self.clientSecret = clientSecret
        self.code = code
    }
    
    var endpoint: String {
        return ""
    }
    
    var method: NetworkService.Method {
        return .POST
    }
    
    var url: URL? {
        return GithubConfig.accessTokenURL()
    }
    
    var params: (dict: [String : String], type: NetworkService.ParamsType)? {
        return ([
            "client_id" : self.clientID,
            "client_secret" : self.clientSecret,
            "code" : self.code
            ], .String)
    }
    
    var headers: HTTPRequest.Headers? {
        return self.jsonHeader()
    }
}
