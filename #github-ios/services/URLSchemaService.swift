//
//  URLSchemaService.swift
//  #github-ios
//
//  Created by Artur on 13/03/2017.
//  Copyright © 2017 Artur Matusiak. All rights reserved.
//

import Foundation
import UIKit

final class URLSchemaService: NSObject, AppSerivce {
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        if let host = url.host, host == "auth" {
            
            let queryItems = URLComponents(string: url.absoluteString)?.queryItems
            let codeParam = queryItems?.filter {$0.name == "code"}.first?.value
            
            guard let _ = codeParam else {
                print("No code, can't keep going.")
                return false
            }
            
            let request = ClaimAccessTokenRequest(clientID: GithubConfig.CLIENT_ID, clientSecret: GithubConfig.CLIENT_SECRET, code: codeParam!)
            let networkService = NetworkService()
            
            
            networkService.request(for: request, success: { (obj: [String : String]?) in
                if let _ = obj {
                    let accessToken = AccessToken(withDictionary: obj!)
                    print("accessToken: \(accessToken)")
                }

            }, failure: { (error) in
                
            })
        }
        return true

    }
    
}
