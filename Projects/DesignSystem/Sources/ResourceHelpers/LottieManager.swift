//
//  LottieManager.swift
//  DesignSystem
//
//  Created by 최주리 on 6/19/26.
//

import Foundation

import Lottie

public enum ByeBooLottie {
    case boriCake
    case boriCongrate
    case boriHome
    case boriNewborn
    case loading
    
    public var name: String {
        switch self {
        case .boriCake:
            "bori_cake"
        case .boriCongrate:
            "bori_congrate"
        case .boriHome:
            "bori_home"
        case .boriNewborn:
            "bori_newborn"
        case .loading:
            "Loading_byeboo"
        }
    }
    
    @MainActor
    public func makeAnimationView() -> LottieAnimationView {
        return LottieAnimationView(name: name, bundle: .module)
    }
}
