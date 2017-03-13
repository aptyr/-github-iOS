//
//  ViewController.swift
//  #github-ios
//
//  Created by Artur on 07/03/2017.
//  Copyright © 2017 Artur Matusiak. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url = URL (string: "https://github.com/login/oauth/authorize?client_id=\(GithubConfig.CLIENT_ID)");
        let requestObj = URLRequest(url: url!);
        self.webView.loadRequest(requestObj);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

