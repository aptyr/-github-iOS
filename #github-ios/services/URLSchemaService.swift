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
            
            let accessTokenRequest = ClaimAccessTokenRequest(clientID: GithubConfig.CLIENT_ID, clientSecret: GithubConfig.CLIENT_SECRET, code: codeParam!)
            
            let networkService = NetworkService()
            
            
            networkService.request(forHTTP: accessTokenRequest, success: { (accessToken: AccessToken?) in
                
                if let _ = accessToken {
                   
                    print("accessToken: \(accessToken!.accessTokenKey)")
                    
                    let r = RegisterUserRequest(email: "mail@matusiakartur.com", accessTokenKey: accessToken!.accessTokenKey!)
                    r.perform(success: nil, failure: nil)
                    
                    let userRequest = UserRequest(withAccessTokenKey: accessToken!.accessTokenKey!)
                    
                    networkService.request(forHTTP: userRequest, success: { (obj: User?) in
                        
                    }, failure: { (error) in
                        print("error \(error)")
                    })
                    
                }
                
                
            }, failure: { (error) in
                print("error: \(error)")
            })
            
        }
        return true

    }
    
}
