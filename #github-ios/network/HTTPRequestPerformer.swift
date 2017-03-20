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
    
    func perform(success: ((Data?) -> Void)?, failure: ((Error) -> Void)?) {
        guard let url = self.request.url else { return }
        
        var urlRequest = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10.0)
            
        urlRequest.allHTTPHeaderFields = self.request.headers
        urlRequest.httpMethod = self.request.method.rawValue
        
        
        if let params = self.request.params {
            if case .String = params.type {
                
                let stringParams = params.dict.map { $0.key + "=" + $0.value }.reduce("",  { $0 + "&" + $1 } )
                urlRequest.httpBody = stringParams.data(using: String.Encoding.utf8)
                
            } else {
                urlRequest.httpBody = try? JSONSerialization.data(withJSONObject: params.dict, options: [])
            }
        }
        
        let session = URLSession.shared

        task = session.dataTask(with: urlRequest, completionHandler: { data, response, error in
            if let _ = error {
                failure?(error!)
            } else {
                success?(data)
            }
        })
        
        task?.resume()
        }

    
}
