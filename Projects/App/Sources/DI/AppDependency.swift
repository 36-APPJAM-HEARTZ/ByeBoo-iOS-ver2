import NeedleFoundation

import Data
import DomainInterface
import Domain

import SplashFeature

public final class AppDependency: BootstrapComponent {
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
extension AppDependency {
    public var blocksRepository: BlocksInterface {
        shared { DefaultBlocksRepository(networkService: network) }
    }
}

// MARK: - UseCase
extension AppDependency {
    public var blockUserUseCase: BlockUserUseCase {
        shared { DefaultBlockUserCase(repository: blocksRepository) }
    }
}

// MARK: - Features
extension AppDependency {
    public var splashComponent: SplashComponent {
        SplashComponent(parent: self)
    }
}

