//
//  DependencyRegistrationService.swift
//  MovieBood
//
//  Created by YILDIRIM on 1.04.2023.
//

import Resolver
import UIKit

final class DependencyRegistrationService : NSObject, UIApplicationDelegate {
    typealias Registration = () -> Void
    
    private lazy var registrations : [Registration] = [registerService,
                                                       registerRepositories,
                                                       registerRemoteServices]
    
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]?) -> Bool {
        register()
    }
    
    private func register() -> Bool {
        Resolver.defaultScope = .graph
        registrations.forEach{ $0() }
        return true
    }
    
}
