//
//  LoginInteractor.swift
//  #github-ios
//
//  Created by Artur on 05/04/2017.
//  Copyright © 2017 Artur Matusiak. All rights reserved.
//

import Foundation

class LoginInteractor: LoginInteractable {
    
    private let presenter: LoginPresenter
    private let networkService = NetworkService()
    
    required init(presenter: LoginPresenter) {
        self.presenter = presenter
    }
    
    func getAccessToken(code: String) {
        let accessTokenRequest = ClaimAccessTokenRequest(clientID: GithubConfig.CLIENT_ID, clientSecret: GithubConfig.CLIENT_SECRET, code: code)
        networkService.request(forHTTP: accessTokenRequest, success: { (accessToken: AccessToken?) in
            self.presenter.obtain(accessToken: accessToken!)
        }, failure: { (error) in
            print("error \(error)")
        })
    }
}
