//
//  HTTPRequestResult.swift
//  #github-ios
//
//  Created by Artur on 20/03/2017.
//  Copyright © 2017 Artur Matusiak. All rights reserved.
//

import Foundation

protocol HTTPRequestResult {
    
    init(withApiData data: Data) throws
    
}
