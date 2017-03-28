//
//  HTTPRequestPerformer.swift
//  #github-ios
//
//  Created by Artur on 14/03/2017.
//  Copyright © 2017 Artur Matusiak. All rights reserved.
//

import Foundation

final class HTTPRequestPerformer {
    
    private var urlRequest: URLRequest?
    private var task: URLSessionDataTask?
    
    init (withHTTPRequest request: HTTPRequest) {
        self.urlRequest = self.urlRequest(for: request)
    }
    
    func perform(success: ((Data?) -> Void)?, failure: ((Error) -> Void)?) {
        guard let urlRequest = self.urlRequest else { return }
        
        task = URLSession.shared.dataTask(with: urlRequest, completionHandler: { data, response, error in
            if let _ = error {
                failure?(error!)
            } else {
                success?(data)
            }
        })
        
        task?.resume()
    }
    
}

extension HTTPRequestPerformer {

    fileprivate func urlRequest(for request: HTTPRequest) -> URLRequest? {
        guard let url = request.url else { return nil }

        var urlRequest = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 5.0)

        urlRequest.allHTTPHeaderFields = request.headers
        urlRequest.httpMethod = request.method.rawValue
        
        if let params = request.params {
            if case .String = params.type {
                
                let stringParams = params.dict.map { $0.key + "=" + $0.value }.reduce("",  { $0 + "&" + $1 } )
                urlRequest.httpBody = stringParams.data(using: String.Encoding.utf8)
                
            } else {
                urlRequest.httpBody = try? JSONSerialization.data(withJSONObject: params.dict, options: [])
            }
        }
        
        return urlRequest
    }
}
