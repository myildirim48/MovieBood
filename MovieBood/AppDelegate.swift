//
//  AppDelegate.swift
//  MovieBood
//
//  Created by YILDIRIM on 1.04.2023.
//

import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate{
    lazy var appDelegateServices: [UIApplicationDelegate] = [DependencyRegistrationService()]
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        return appDelegateServices.allSatisfy { service -> Bool in
            service.application?(application, didFinishLaunchingWithOptions: launchOptions) ?? true
        }
    }
}
