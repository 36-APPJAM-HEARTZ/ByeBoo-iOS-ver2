//
//  SplashViewController.swift
//  ByeBoo-iOS
//
//  Created by 이나연 on 9/2/25.
//

import Combine
import UIKit

import PresentationKit
import SplashFeatureInterface

public final class SplashViewController: BaseViewController {
    
    private let rootView = SplashView()
    private let viewModel: SplashViewModel
    private weak var coordinator: SplashCoordinatorProtocol?
    private var cancellables = Set<AnyCancellable>()
    
    public init(
        viewModel: SplashViewModel,
        coordinator: SplashCoordinatorProtocol
    ) {
        self.viewModel = viewModel
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        view = rootView
        viewModel.action(.viewDidLoad)
        bind()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) { [weak self] in
            guard let self = self else { return }
            if self.cancellables.isEmpty {
                timeoutFallback()
            }
        }
    }
}

extension SplashViewController {
    
    private func bind() {
        viewModel.output.autoLoginPublisher
            .receive(on: DispatchQueue.main)
            .sink { result in
                switch result {
                case .success:
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [weak self] in
                        self?.coordinator?.finished?()
                    }
                case .failure(_):
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [weak self] in
                        self?.coordinator?.showLogin()
                    }
                }
            }
            .store(in: &cancellables)
    }
}

extension SplashViewController {
    private func timeoutFallback() {
        coordinator?.showLogin()
    }
}
