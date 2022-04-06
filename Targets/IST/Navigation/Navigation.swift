//
//  Navigation.swift
//  IST
//
//  Created by etuzun on 5.04.2022.
//  Copyright © 2022 IST. All rights reserved.
//

import Foundation
import UIKit

public class DefaultNavigation: UINavigationController {
    var isStatusBarDark = false {
        didSet {
            setNeedsStatusBarAppearanceUpdate()
            UIApplication.shared.statusBarStyle = .lightContent
        }
    }
    var isNavigationBarHide = true {
        didSet {
            self.navigationBar.setBackgroundImage(UIImage(), for: .default)
            self.navigationBar.backgroundColor  = UIColor.clear
            self.navigationBar.shadowImage = UIImage()
        }
    }
    public override var preferredStatusBarStyle: UIStatusBarStyle {
        return isDark ? .lightContent : .default
    }
}

class Navigation {
    private let window : UIWindow?
    init(window: UIWindow ) {
        self.window = window
    }
    func startApp() {
        
        let root = DefaultNavigation(rootViewController: Launch())
        root.isNavigationBarHide = true
        window!.rootViewController = root
        window!.makeKeyAndVisible()
    }
    
    func startTestApp() {
        
        let root = DefaultNavigation(rootViewController: LaunchTest())
        root.isNavigationBarHide = true
        window!.rootViewController = root
        window!.makeKeyAndVisible()
    }
    
}
