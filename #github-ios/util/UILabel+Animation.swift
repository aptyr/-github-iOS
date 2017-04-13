//
//  UILabel+Animation.swift
//  #github-ios
//
//  Created by Artur on 06/04/2017.
//  Copyright © 2017 Artur Matusiak. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    
    func animate(newText: String, characterDelay: TimeInterval) {
        
        DispatchQueue.main.async {
            
            self.text = ""
            
            for (index, character) in newText.characters.enumerated() {
                DispatchQueue.main.asyncAfter(deadline: .now() + characterDelay * Double(index)) {
                    self.text?.append(character)
                }
            }
        }
    }

    
}
