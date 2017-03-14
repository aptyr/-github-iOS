//
//  Request.swift
//  #github-ios
//
//  Created by Artur on 14/03/2017.
//  Copyright © 2017 Artur Matusiak. All rights reserved.
//

import Foundation

protocol Request {
    
    func perform(success: ((AnyObject?) -> Void)?, failure: ((Error) -> Void)?)
}
