//
//  AppDelegate.swift
//  ByeBoo
//
//  Created by 최주리 on 6/9/26.
//

import UIKit

import NeedleFoundation
import KakaoSDKCommon
import Firebase

import Core

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        registerProviderFactories()
        
        KakaoSDK.initSDK(appKey: ConfigManager.kakaoNativeAppKey)
        FirebaseApp.configure()
        
        return true
    }
}
