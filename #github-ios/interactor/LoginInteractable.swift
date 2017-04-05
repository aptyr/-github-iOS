//
//  LoginInteractor.swift
//  #github-ios
//
//  Created by Artur on 05/04/2017.
//  Copyright © 2017 Artur Matusiak. All rights reserved.
//

import Foundation

class LoginInteractable: LoginInteractor {
    
    private let presenter: LoginPresenter
    private let networkService = NetworkService()
    
    required init(presenter: LoginPresenter) {
        self.presenter = presenter
        
        NotificationCenterController.shared.observeAuthURLSchema(notificationHandler: self.authURLSchemaObserver)
    }
    
    
    private func authURLSchemaObserver(notification: Notification) {
        
        let url = notification.object as? URL
        
        let queryItems = URLComponents(string: (url?.absoluteString)!)?.queryItems
        let codeParam = queryItems?.filter {$0.name == "code"}.first?.value
                
        if let _ = codeParam {
            self.presenter.receivedAuthCode(code: codeParam!)
        }
        
    }
    
    func getAccessToken(code: String) {
        let accessTokenRequest = ClaimAccessTokenRequest(clientID: GithubConfig.CLIENT_ID, clientSecret: GithubConfig.CLIENT_SECRET, code: code)
        networkService.request(forHTTP: accessTokenRequest, success: { (accessToken: AccessToken?) in
            print("accessToken \(accessToken?.accessTokenKey)")
        }, failure: { (error) in
            print("error \(error)")
        })
    }
}
