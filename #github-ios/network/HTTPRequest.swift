//
//  HTTPRequest.swift
//  #github-ios
//
//  Created by Artur on 14/03/2017.
//  Copyright © 2017 Artur Matusiak. All rights reserved.
//

import Foundation

protocol HTTPRequest {
    
    var endpoint: String { get }
    
    var method: NetworkService.Method { get }
    
    var url: URL { get }
    
    var headers: [String: String]? { get }
    
    var params: [String: String]? { get }
    
    var paramsType: HTTPRequestPerformer.ParamsType? { get }
}

extension HTTPRequest {
    
    func jsonHeaders() -> [String : String] {
        return ["Accept" : "application/json"]
    }
    
}
