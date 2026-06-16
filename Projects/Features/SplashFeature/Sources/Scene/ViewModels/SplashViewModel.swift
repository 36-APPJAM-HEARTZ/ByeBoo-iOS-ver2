//
//  SplashViewModel.swift
//  ByeBoo-iOS
//
//  Created by 이나연 on 9/2/25.
//

import Combine
import Foundation

import Core
import DomainInterface
import SplashFeatureInterface

// TODO: @unchecked Sendable - Combine -> AsyncThrowingStream 변경하면 해결 ㅠㅠ 일단 보류
public final class SplashViewModel: @unchecked Sendable {
    private let autoLoginUseCase: AutoLoginUseCase
    
    private var autoLoginSubject: PassthroughSubject<Result<Void, ByeBooError>, Never> = .init()
    var output: Output {
        Output(
            autoLoginPublisher: autoLoginSubject.eraseToAnyPublisher()
        )
    }
    private var cancellables = Set<AnyCancellable>()
    
    public init(
        autoLoginUseCase: AutoLoginUseCase
    ) {
        self.autoLoginUseCase = autoLoginUseCase
    }
}

extension SplashViewModel {
    enum Input {
        case viewDidLoad
    }
    
    struct Output {
        let autoLoginPublisher: AnyPublisher<Result<Void, ByeBooError>, Never>
    }
    
    func action(_ trigger: Input) {
        switch trigger {
        case .viewDidLoad:
            autoLogin()
        }
    }
    
}

extension SplashViewModel {
    private func autoLogin() {
        ByeBooLogger.debug("자동로그인 실행")
        Task {
            do {
                if try await autoLoginUseCase.execute() {
                    autoLoginSubject.send(.success(()))
                    ByeBooLogger.debug("자동로그인 성공")
                }
                else {
                    ByeBooLogger.debug("자동로그인 실패")
                    autoLoginSubject.send(.failure((.noData)))
                }
            } catch {
                guard let error = error as? ByeBooError else {
                    return
                }
                autoLoginSubject.send(.failure((.noData)))
                ByeBooLogger.debug(ByeBooError.networkConnect)
                ByeBooLogger.error(error as ByeBooError)
            }
        }
    }
}
