//
//  Config.swift
//  #github-ios
//
//  Created by Artur on 13/03/2017.
//  Copyright © 2017 Artur Matusiak. All rights reserved.
//

import Foundation

final class GithubConfig {
    
    private class var dictionary : [String: String]? {
        if let url = Bundle.main.url(forResource: "GithubConfig-Info", withExtension: "plist"), let data = try? Data(contentsOf: url) {
            if let result = try? PropertyListSerialization.propertyList(from: data, options: [], format: nil) as? [String : String] {
                return result
            }
        }
        assertionFailure("Can't find GithubConfig-Info.plist file.")
        return nil
    }
    
    class var CLIENT_ID : String {
        guard let value = dictionary?["CLIENT_ID"] else { return "" }
        return value
    }
    
    class var CLIENT_SECRET : String {
        guard let value = dictionary?["CLIENT_SECRET"] else { return "" }
        return value
    }
}

extension GithubConfig {
    
    static func accessTokenURL() -> URL? {
        return URL(string: "https://github.com/login/oauth/access_token")
    }
    
    static func apiURL(for request: HTTPRequest) -> URL? {
        return URL(string: "https://api.github.com\(request.endpoint)")
    }
    
}

