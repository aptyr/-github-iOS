//
//  LoginViewController.swift
//  #github-ios
//
//  Created by Artur on 05/04/2017.
//  Copyright © 2017 Artur Matusiak. All rights reserved.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    
    private var presenter: LoginPresenter!
    
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.presenter = LoginPresentable(view: self)
        
        self.presenter.updateView()
        
        self.initWebView()

    }
    
    private func initWebView() {
        let url = URL (string: "https://github.com/login/oauth/authorize?client_id=\(GithubConfig.CLIENT_ID)");
        let requestObj = URLRequest(url: url!);
        self.webView.loadRequest(requestObj);
    }
    
}
