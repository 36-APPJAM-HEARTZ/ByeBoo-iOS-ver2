//
//  MixpanelType.swift
//  ByeBoo-iOS
//
//  Created by 최주리 on 9/16/25.
//

import Mixpanel

public protocol MixpanelProperty {
    var dictionary: [String: MixpanelType] { get }
}

