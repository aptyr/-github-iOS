//
//  HTTPRequestPerformer.swift
//  #github-ios
//
//  Created by Artur on 14/03/2017.
//  Copyright © 2017 Artur Matusiak. All rights reserved.
//

import Foundation

final class HTTPRequestPerformer {
    
    enum ParamsType {
        case JSON, String
    }
    
    private let request: HTTPRequest
    
    private var task: URLSessionDataTask?
    
    init (withHTTPRequest request: HTTPRequest) {
        self.request = request
    }
    
    func perform(success: ((AnyObject?) -> Void)?, failure: ((Error) -> Void)?) {
        var urlRequest = URLRequest(url: self.request.url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10.0)
            
        urlRequest.allHTTPHeaderFields = self.request.headers
        urlRequest.httpMethod = self.request.method.rawValue
        
        if let paramsType = self.request.paramsType, let params = self.request.params {
            if case .String = paramsType {
                
                let stringParams = params.map { $0.key + "=" + $0.value }.reduce("",  { $0 + "&" + $1 } )
                urlRequest.httpBody = stringParams.data(using: String.Encoding.utf8)
                
            } else {
                urlRequest.httpBody = try? JSONSerialization.data(withJSONObject: params, options: [])
            }
        }
        
        let session = URLSession.shared
        
        task = session.dataTask(with: urlRequest, completionHandler: { data, response, error in
            if let _ = error {
                failure?(error!)
            } else {
                if let data = data, let json = try? JSONSerialization.jsonObject(with: data, options: []) {
                    success?(json as AnyObject?)
                } else {
                    success?(nil)
                }
            }
        })
        
        task?.resume()
        }

    
}
