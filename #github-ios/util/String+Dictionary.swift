//
//  String+Dictionary.swift
//  #github-ios
//
//  Created by Artur on 20/03/2017.
//  Copyright © 2017 Artur Matusiak. All rights reserved.
//

import Foundation

extension String {
    var dictionary: [String : String] {
        let separated1 = self.components(separatedBy: "&")
        
        let separated2 = separated1.map {
            $0.components(separatedBy: "=")
        }
        
        let filtered = separated2.filter {
            $0.count == 2
        }
        
        let map = filtered.map {
            [$0[0] : $0[1]]
        }
        
        let flatMap = map.flatMap { $0 }
        
        let reduced = flatMap.reduce([String : String]()) {
            (res, tuple) -> [String : String] in
            var dict = res
            dict.updateValue(tuple.1, forKey: tuple.0)
            return dict
        }
        
        return reduced
    }
}
