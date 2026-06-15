//
//  AppDelegate.swift
//  ByeBoo
//
//  Created by 최주리 on 6/9/26.
//

import UIKit
import NeedleFoundation

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        registerProviderFactories()

        return true
    }
}
