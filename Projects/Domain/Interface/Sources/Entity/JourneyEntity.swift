//
//  JourneyEntity.swift
//  ByeBoo-iOS
//
//  Created by 최주리 on 7/10/25.
//

import Foundation

public struct JourneyEntity {
    public let title: String
    public let description: String?
    public let style: JourneyType?
    
    public init(title: String, description: String?, style: JourneyType?) {
        self.title = title
        self.description = description
        self.style = style
    }
}
