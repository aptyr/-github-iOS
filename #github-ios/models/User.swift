//
//  User.swift
//  #github-ios
//
//  Created by Artur on 20/03/2017.
//  Copyright © 2017 Artur Matusiak. All rights reserved.
//

import Foundation

struct User: HTTPRequestResult {
    
    init(withApiData data: Data) throws {
     //   let params = try JSONSerialization.jsonObject(with: data, options: []) as! [String: String]

        print("user \(data)")
    }
}
