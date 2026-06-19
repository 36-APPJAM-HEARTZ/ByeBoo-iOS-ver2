//
//  DialogueEntity.swift
//  ByeBoo-iOS
//
//  Created by 최주리 on 11/19/25.
//

import Foundation

public struct DialogueEntity {
    public let dialogue: String
    public let tapDialogue: String
    
    public init(dialogue: String, tapDialogue: String) {
        self.dialogue = dialogue
        self.tapDialogue = tapDialogue
    }
}
