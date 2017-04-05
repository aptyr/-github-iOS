//
//  LoginViewController+View.swift
//  #github-ios
//
//  Created by Artur on 05/04/2017.
//  Copyright © 2017 Artur Matusiak. All rights reserved.
//

import Foundation

extension LoginViewController: LoginView {
 
    
    func webView(asHidden hidden: Bool) {
        self.webView.isHidden = hidden
        
         
    }
}
