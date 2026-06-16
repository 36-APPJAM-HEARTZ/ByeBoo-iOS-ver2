//
//  SplashCoordinatorProtocol.swift
//  SplashFeature
//
//  Created by 최주리 on 6/16/26.
//

import PresentationKit

@MainActor
public protocol SplashCoordinatorProtocol: FinishableProtocol {
    func showSplash()
    func showLogin()
}
