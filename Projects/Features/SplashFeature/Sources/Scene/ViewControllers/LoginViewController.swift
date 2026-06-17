//
//  LoginViewController.swift
//  ByeBoo-iOS
//
//  Created by 이나연 on 8/19/25.
//

import AuthenticationServices
import Combine
import UIKit

import Mixpanel

import PresentationKit
import Core
import SplashFeatureInterface

final class LoginViewController: BaseViewController {
    
    private let rootView = LoginView()
    private let viewModel: LoginViewModel
    private weak var coordinator: SplashCoordinatorProtocol?
    private var cancellables = Set<AnyCancellable>()
    
    init(
        viewModel: LoginViewModel,
        coordinator: SplashCoordinatorProtocol
    ) {
        self.viewModel = viewModel
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        view = rootView
        setAddTarget()
        rootView.startAnimation()
        requestNoticeAuthorization()
        bind()
    }
    
    override func setAddTarget() {
        rootView.kakaoLoginButton.addTarget(self, action: #selector(kakaoLoginButtonDidTap) , for: .touchUpInside)
        rootView.appleLoginButton.addTarget(self, action: #selector(appleLoginButtonDidTap), for: .touchUpInside)
    }
}

extension LoginViewController{
    
    private func requestNoticeAuthorization() {
        UNUserNotificationCenter.current().getNotificationSettings {
            guard $0.authorizationStatus == .notDetermined else {
                return
            }
            
            let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
            UNUserNotificationCenter.current().requestAuthorization(
                options: authOptions,
                completionHandler: { _, _ in
                    DispatchQueue.main.async {
                        UIApplication.shared.registerForRemoteNotifications()
                    }
                }
            )
        }
    }
    
    @objc
    private func kakaoLoginButtonDidTap() {
        rootView.kakaoLoginButton.isUserInteractionEnabled = false
        viewModel.action(.socialLoginButtonDidTap(platform: .KAKAO))
    }
    
    @objc
    private func appleLoginButtonDidTap() {
        rootView.appleLoginButton.isUserInteractionEnabled = false
        viewModel.action(.socialLoginButtonDidTap(platform: .APPLE))
    }
}

extension LoginViewController {
    private func bind() {
        viewModel.output.isRegisteredPublisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] result in
                self?.rootView.appleLoginButton.isUserInteractionEnabled = true
                self?.rootView.kakaoLoginButton.isUserInteractionEnabled = true
                
                switch result {
                case .success(let isRegisterd):
                    ByeBooLogger.debug("온보딩 완료 여부 \(isRegisterd)")
                    
                    if isRegisterd {
                        self?.coordinator?.finished?()
                    } else {
                        // onboarding으로 연결
                    }
                case .failure(let error):
                    ByeBooLogger.debug(error)
                }
            }
            .store(in: &cancellables)
    }
    
}
