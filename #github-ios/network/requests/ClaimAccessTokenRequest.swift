//
//  ClaimAccessToken.swift
//  #github-ios
//
//  Created by Artur on 14/03/2017.
//  Copyright © 2017 Artur Matusiak. All rights reserved.
//

import Foundation

final class ClaimAccessTokenRequest: Request, HTTPRequest {
    
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
    
    var url: URL {
        return URL(string: "https://github.com/login/oauth/access_token\(endpoint)")!
    }
    
    var params: [String : String]? {
        return [
            "client_id" : self.clientID,
            "client_secret" : self.clientSecret,
            "code" : self.code
        ]
    }
    
    var headers: [String : String]? {
        return self.jsonHeaders()
    }
    
    var paramsType: HTTPRequestPerformer.ParamsType? {
        return .String
    }
    
    func perform(success: ((AnyObject?) -> Void)?, failure: ((Error) -> Void)?) {
        let requestPerformer = HTTPRequestPerformer(withHTTPRequest: self)
        requestPerformer.perform(success: success, failure: failure)
    }
}
