//
//  HomeComponent.swift
//  HomeFeature
//
//  Created by 최주리 on 6/18/26.
//

import UIKit

import NeedleFoundation

import DomainInterface
import HomeFeatureInterface

public protocol HomeDependency: Dependency {
    var fetchCharacterDialogueUseCase: FetchCharacterDialogueUseCase { get }
    var fetchQuestStatusUseCase: FetchQuestStatusUseCase { get }
    var fetchUserJourneyUseCase: FetchUserJourneyUseCase { get }
    var getUserNameUseCase: GetUserNameUseCase { get }
    var setHelperUseCase: SetHelperUseCase { get }
    var getHelperUseCase: GetHelperUseCase { get }
}

@MainActor
public final class HomeComponent: Component<HomeDependency> {
    public func homeViewController(coordinator: HomeCoordinatorProtocol) -> UIViewController {

        let vm = HomeViewModel(
            fetchCharacterDialogueUseCase: dependency.fetchCharacterDialogueUseCase,
            fetchQuestStatusUseCase: dependency.fetchQuestStatusUseCase,
            fetchUserJourneyUseCase: dependency.fetchUserJourneyUseCase,
            getUserNameUseCase: dependency.getUserNameUseCase,
            setHelperUseCase: dependency.setHelperUseCase,
            getHelperUseCase: dependency.getHelperUseCase
        )
        
        return HomeViewController(viewModel: vm, coordinator: coordinator)
    }
    
    public func noticeViewController(coordinator: HomeCoordinatorProtocol, isExist: Bool) -> UIViewController {
        let vc = NoticesViewController(coordinator: coordinator, isExistNotice: isExist)
        return vc
    }
}


