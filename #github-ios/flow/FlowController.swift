//
//  FlowController.swift
//  #github-ios
//
//  Created by Artur on 05/04/2017.
//  Copyright © 2017 Artur Matusiak. All rights reserved.
//

import UIKit

class FlowController {
    
    private class func openViewController<T: UIViewController>(context: UIViewController, storyboardName: String, viewControllerIdentifier: String) -> T? {
        guard let viewController = UIStoryboard(name: storyboardName, bundle: nil).instantiateViewController(withIdentifier: viewControllerIdentifier) as? T
            else { return nil }
        
        if let navigator = context.navigationController {
            navigator.pushViewController(viewController, animated: true)
        } else {
            context.present(viewController, animated: true, completion: nil)
        }
        return viewController
    }

    @discardableResult
    class func openLoginViewController(context: UIViewController) -> LoginViewController? {
        let vc : LoginViewController? = openViewController(context: context, storyboardName: "Login", viewControllerIdentifier: "loginViewController")
        return vc
    }
    
}
