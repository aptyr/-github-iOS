//
//  LoginPresentable.swift
//  #github-ios
//
//  Created by Artur on 05/04/2017.
//  Copyright © 2017 Artur Matusiak. All rights reserved.
//

import Foundation

class LoginPresenter: LoginPresentable {
    
    private let view: LoginView
    private var interactor: LoginInteractable?
    
    private var state: LoginState? {
        return LoginStateFactory.getLoginState(hasAccessTokenKey: Secure.token(forUser: "aptyr") != nil)
    }
    
    required init(view: LoginView) {
        self.view = view
        
        NotificationCenterController.observeAuthURLSchema(notificationHandler: self.authURLSchemaObserver)
        
        self.interactor = LoginInteractor(presenter: self)
        
    }
    
    private func authURLSchemaObserver(notification: Notification) {
        let url = notification.object as? URL
        let queryItems = URLComponents(string: (url?.absoluteString)!)?.queryItems
        let codeParam = queryItems?.filter {$0.name == "code"}.first?.value
        
        if let _ = codeParam {
            self.interactor?.getAccessToken(code: codeParam!)
        }
        
    }

    
    func updateView() {
        
        guard let state = self.state else { return }
        
        self.view.webView(asHidden: state.shouldWebViewBeHidden())
    }
    
    func obtain(accessToken: AccessToken) {
        try? Secure.store(accessToken: accessToken, forUser: "aptyr")
        
        self.view.close()
    }
}


