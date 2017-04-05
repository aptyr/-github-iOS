//
//  LoginPresenter.swift
//  #github-ios
//
//  Created by Artur on 05/04/2017.
//  Copyright © 2017 Artur Matusiak. All rights reserved.
//

import Foundation


protocol LoginPresenter : class, BasePresenter {
    
    init(view: LoginView)
    
    func receivedAuthCode(code: String)
        
}
