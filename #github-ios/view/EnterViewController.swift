//
//  EnterViewController.swift
//  #github-ios
//
//  Created by Artur on 06/04/2017.
//  Copyright © 2017 Artur Matusiak. All rights reserved.
//

import Foundation
import UIKit

class EnterViewController: UIViewController {
    
    private let newText = "print(\"Hello, world\")"
    private let characterDelay = 0.1
    private var text = ""
    @IBOutlet weak var backgroundTypewriterLabel: UILabel!
    
    override func viewDidLoad() {
        backgroundTypewriterLabel.animate(newText: newText, characterDelay: 0.15)
    }
    
    
    
    @IBAction func loginButtonClick() {
        FlowController.openLoginViewController(context: self)
    }
    
}
