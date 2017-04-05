//
//  LoginPresentable.swift
//  #github-ios
//
//  Created by Artur on 05/04/2017.
//  Copyright © 2017 Artur Matusiak. All rights reserved.
//

import Foundation

class LoginPresentable: LoginPresenter {
    
    private let view: LoginView
    private var interactor: LoginInteractor?
    
    private var state: LoginState? {
        return LoginStateFactory.getLoginState(hasAccessTokenKey: Secure.token(forUser: "aptyr") != nil)
    }
    
    required init(view: LoginView) {
        self.view = view
        
        self.interactor = LoginInteractable(presenter: self)
        
    }
    
    func updateView() {
        
        guard let state = self.state else { return }
        
        self.view.webView(asHidden: state.shouldWebViewBeHidden())
    }
    
    func receivedAuthCode(code: String) {
        self.interactor?.getAccessToken(code: code)
    }
}


