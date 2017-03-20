//
//  HTTPRequest.swift
//  #github-ios
//
//  Created by Artur on 14/03/2017.
//  Copyright © 2017 Artur Matusiak. All rights reserved.
//

import Foundation

protocol HTTPRequest {
    
    typealias Headers = [String : String]
    
    var endpoint: String { get }
    
    var method: NetworkService.Method { get }
    
    var url: URL? { get }
    
    var headers: Headers? { get }
    
    var params: (dict: [String: String], type: HTTPRequestPerformer.ParamsType)? { get }
}

extension HTTPRequest {
    
    func jsonHeader() -> Headers {
        return ["Accept" : "application/json"]
    }
    
    func tokenHeader(accessTokenKey key: String) -> Headers {
        return ["Authorization":"token \(key)"]
    }
    
}
