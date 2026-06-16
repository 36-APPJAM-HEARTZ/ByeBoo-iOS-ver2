import NeedleFoundation

import Data
import DomainInterface
import Domain

import SplashFeature

public final class AppComponent: BootstrapComponent {
    // MARK: - Persistence
    public var keychain: KeychainService { shared { DefaultKeychainService() } }
    public var userDefaults: UserDefaultService { shared { DefaultUserDefaultService() } }
    
    // MARK: - Network
    public var interceptor: NetworkInterceptor {
        shared {
            NetworkInterceptor(
                tokenService: tokenService,
                keychainService: keychain
            )
        }
    }
    public var tokenService: TokenService {
        shared { DefaultTokenService(keychainService: keychain) }
    }
    public var network: NetworkService {
        shared { DefaultNetworkService(interceptor: interceptor) }
    }
}

// MARK: - Repository
extension AppComponent {
    public var blocksRepository: BlocksInterface {
        shared { DefaultBlocksRepository(networkService: network) }
    }
    public var authRepository: AuthInterface {
        shared {
            DefaultAuthRepository(
                network: network,
                keychainService: keychain,
                userDefaultsService: userDefaults,
                tokenService: tokenService
            )
        }
    }
}

// MARK: - UseCase
extension AppComponent {
    public var blockUserUseCase: BlockUserUseCase {
        shared { DefaultBlockUserCase(repository: blocksRepository) }
    }
    public var autoLoginUseCase: AutoLoginUseCase {
        shared { DefaultAutoLoginUseCase(repository: authRepository) }
    }
}

// MARK: - Features
extension AppComponent {
    public var splashComponent: SplashComponent {
        SplashComponent(parent: self)
    }
}

