//
//  NetworkService.swift
//  #github-ios
//
//  Created by Artur on 14/03/2017.
//  Copyright © 2017 Artur Matusiak. All rights reserved.
//

import Foundation

class NetworkService {
    
    enum Method: String {
        case POST, GET
    }
    
    enum ParamsType {
        case JSON, String
    }
    
    func request<T>(forFirebase request: FirebaseRequest, success: ((T?) -> Void)?, failure: ((Error) -> Void)?) {
        request.perform(success: {
            if let obj = $0 {
                success?(obj as? T)
            } else {
                success?(nil)
            }
        }, failure: { failure?($0) })
    }
    
    func request<T: HTTPRequestResult>(forHTTP request: HTTPRequest, success: ((T?) -> Void)?, failure: ((Error) -> Void)?) {
        let requestPerformer = HTTPRequestPerformer(withHTTPRequest: request)
        requestPerformer.perform(success: { (result) in
            
            if let _ = result {
                success?(self.content(data: result!))
                return
            }
            
            success?(nil)
            
        }, failure: failure)
    }
    
    
}


extension NetworkService {
    
    fileprivate func content<T: HTTPRequestResult>(data: Data) -> T? {
        
        do {
            return try T(withApiData: data)
            
        } catch {
            print("content error: \(error)")
        }
        
        return nil
    }

    
}
