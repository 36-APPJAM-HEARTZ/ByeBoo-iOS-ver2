//
//  FetchCharacterDialogueUseCase.swift
//  Domain
//
//  Created by 최주리 on 6/19/26.
//


public protocol FetchCharacterDialogueUseCase {
    func execute() async throws -> DialogueEntity
}
