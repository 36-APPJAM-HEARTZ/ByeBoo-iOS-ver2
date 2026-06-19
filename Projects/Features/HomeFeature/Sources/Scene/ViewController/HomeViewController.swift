//
//  HomeViewController.swift
//  ByeBoo-iOS
//
//  Created by 이나연 on 7/5/25.
//

import Combine
import UIKit

import Mixpanel

import Core
import PresentationKit
import DomainInterface
import HomeFeatureInterface

final class HomeViewController: BaseViewController {
    
    private let viewModel: HomeViewModel
    private weak var coordinator: HomeCoordinatorProtocol?
    private var cancellables = Set<AnyCancellable>()
    private let rootView = HomeView()
    
    private var state: HomeState = .beforeJourneyStart
    private var isFirstVisit: Bool = true
    private var journeyType: JourneyType = .recording
    private var isAnimating: Bool = false
    private var isExistNotice: Bool?
    
    init(
        viewModel: HomeViewModel,
        coordinator: HomeCoordinatorProtocol
    ) {
        self.viewModel = viewModel
        self.coordinator = coordinator
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bind()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewModel.action(.viewWillAppear)
        
        let property = HomeEvents.HomePageProperty(
            isFirstPageView: isFirstVisit,
            journeyType: journeyType.mixpanelKey
        )
        Mixpanel.mainInstance().track(
            event: HomeEvents.Name.homePageView,
            properties: property.dictionary
        )
        
        if isFirstVisit { isFirstVisit.toggle() }
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        // 추후 API 연동 시 뷰모델 액션을 호출하여 알림 유무를 판단할 예정
        rootView.headerView.updateNotice(isExist: true)
        isExistNotice = true
    }
    
    override func setAddTarget() {
        setGesture()
        rootView.headerView.helperButton.addTarget(
            self,
            action: #selector(helperDidTap),
            for: .touchUpInside
        )
        rootView.headerView.noticeButton.addTarget(
            self,
            action: #selector(noticeButtonDidTap),
            for: .touchUpInside
        )
    }
    
    private func setGesture() {
        let headerTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(headerDidTap))
        headerTapGestureRecognizer.isEnabled = true
        headerTapGestureRecognizer.cancelsTouchesInView = false
        rootView.headerView.homeStateView.addGestureRecognizer(headerTapGestureRecognizer)
        
        let boriTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(boriDidTap))
        boriTapGestureRecognizer.isEnabled = true
        boriTapGestureRecognizer.cancelsTouchesInView = false
        rootView.homeBori.addGestureRecognizer(boriTapGestureRecognizer)
    }
}

extension HomeViewController {
    
    @objc
    private func headerDidTap() {
        switch state {
        case .beforeJourneyStart, .beforeQuest, .afterQuest:
            coordinator?.showQuestTab()
        case .afterJourney:
//            let viewController = ViewControllerFactory.shared.makeNewJourneySelectViewController()
//            viewController.hidesBottomBarWhenPushed = true
//            navigationController?.pushViewController(viewController, animated: false)
            break
        }
    }
    
    @objc
    private func helperDidTap() {
        viewModel.action(.helperDidTap)
        rootView.helperDidTap()
        
        Mixpanel.mainInstance().track(event: HomeEvents.Name.tutorialIconClick)
        
        coordinator?.showTutorial()
    }
    
    @objc
    private func noticeButtonDidTap() {
        guard let isExistNotice else { return }
        
//        let viewController = ViewControllerFactory.shared.makeNoticesViewController(isExistNotice: isExistNotice)
//        viewController.hidesBottomBarWhenPushed = true
//        
//        self.navigationController?.setNavigationBarHidden(false, animated: false)
//        self.navigationController?.pushViewController(viewController, animated: false)
        
        coordinator?.showNotice(isExist: isExistNotice)
    }
    
    @objc
    private func boriDidTap() {
        
        guard !isAnimating,
              case .success(let dialogues) = viewModel.dialoguesResult else { return }
        
        isAnimating = true
        rootView.updateOnboardingText(dialogues.tapDialogue, withAnimation: true)

        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
            self?.rootView.updateOnboardingText(dialogues.dialogue, withAnimation: true)

            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self?.isAnimating = false
            }
        }
    }
}

extension HomeViewController/*: ToastPresentable, ToastErrorHandler*/ {
    private func bind() {
        viewModel.output.characterResult
            .receive(on: DispatchQueue.main)
            .sink { [weak self] result in
                switch result {
                case .success(let dialogues):
                    self?.rootView.updateOnboardingText(dialogues.dialogue)
                case .failure(let error):
//                    self?.handleError(error)
                    break
                }
            }
            .store(in: &cancellables)
        
        Publishers.CombineLatest3(
            viewModel.output.userResult,
            viewModel.output.journeyResult,
            viewModel.output.homeStateResult
        )
            .receive(on: DispatchQueue.main)
            .sink { [weak self]
                name,
                journey,
                state in
                switch (name, journey, state) {
                case let (_, .success(journey), .success(state)):
                    self?.rootView.updateState(state.currentStatus)
                    self?.state = state.currentStatus
                    self?.journeyType = JourneyType.titleToEnum(journey.title) ?? .recording
                case let (_, .success(journey), .failure(.notFound)):
                    self?.rootView.updateState(.beforeJourneyStart, journey.title)
                    self?.state = .beforeJourneyStart
                    self?.journeyType = JourneyType.titleToEnum(journey.title) ?? .recording
                case let (_, .failure(.notFound), .success(state)):
                    self?.rootView.updateState(state.currentStatus)
                    self?.state = state.currentStatus
                case (_, .failure(let error), _), (_, _, .failure(let error)):
//                    self?.handleError(error)
                    break
                default:
                    ByeBooLogger.error(ByeBooError.unknownError)
                }
            }
            .store(in: &cancellables)
        
        viewModel.output.helperResult
            .receive(on: DispatchQueue.main)
            .sink { [weak self] result in
                if !result {
                    self?.rootView.headerView.startHelperAnimation()
                }
            }
            .store(in: &cancellables)
    }
}
