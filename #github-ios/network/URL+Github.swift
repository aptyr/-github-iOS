//
//  URL+Github.swift
//  #github-ios
//
//  Created by Artur on 17/03/2017.
//  Copyright © 2017 Artur Matusiak. All rights reserved.
//

import Foundation

extension URL {
    
    static func githubAccessTokenURL() -> URL? {
        return URL(string: "https://github.com/login/oauth/access_token")
    }
    
    static func githubApiURL(for request: HTTPRequest) -> URL? {
        return URL(string: "https://api.github.com\(request.endpoint)")
    }
    
}
