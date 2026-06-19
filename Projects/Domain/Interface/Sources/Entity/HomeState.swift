//
//  HomeState.swift
//  Domain
//
//  Created by 최주리 on 6/18/26.
//


public enum HomeState {
    case beforeJourneyStart // 여정을 시작하지 않은 경우
    case beforeQuest // 퀘스트 완료 전
    case afterQuest // 퀘스트 완료 후
    case afterJourney // 여정 완료 후 & 새로운 여정 시작 전
}
