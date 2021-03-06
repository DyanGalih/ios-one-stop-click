//
//  ProfileRouter.swift
//  OSC
//
//  Created by Dyan Galih on 05/07/19.
//  Copyright (c) 2019 Dyan Galih. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

@objc protocol ProfileRoutingLogic {
    // func routeToSomewhere(segue: UIStoryboardSegue?)
    func routeToLogin(segue: UIStoryboardSegue?)
}

protocol ProfileDataPassing {
    var dataStore: ProfileDataStore? { get }
}

class ProfileRouter: NSObject, ProfileRoutingLogic, ProfileDataPassing {
    weak var viewController: ProfileViewController?
    var dataStore: ProfileDataStore?
    func routeToLogin(segue: UIStoryboardSegue?) {
        if let segue = segue {
            _ = segue.destination as! LoginViewController
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let destinationVC = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
            navigateToLogin(source: viewController!, destination: destinationVC)
        }
    }
    
    func navigateToLogin(source: ProfileViewController, destination: LoginViewController) {
        source.show(destination, sender: nil)
        source.dismiss(animated: false, completion: nil)
    }
}
