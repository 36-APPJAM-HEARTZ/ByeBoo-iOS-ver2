import NeedleFoundation

import Data
import DataInterface
import DomainInterface
import Domain

import SplashFeature
import MainTabFeature

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
    public var usersRepository: UsersInterface {
        shared {
            DefaultUsersRepository(
                network: network,
                userDefaultsService: userDefaults,
                keychainService: keychain
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
    public var getIsRegisteredUseCase: GetIsRegisteredUseCase {
        shared { DefaultGetIsRegisteredUseCase(repository: usersRepository) }
    }
    public var getUserIDUseCase: GetUserIDUseCase {
        shared { DefaultGetUserIDUseCase(repository: usersRepository) }
    }
    public var socialLoginUseCase: SocialLoginUseCase {
        shared { DefaultSocialLoginUseCase(repository: authRepository) }
    }
    public var fetchCharacterDialogueUseCase: FetchCharacterDialogueUseCase {
        shared { DefaultFetchCharacterDialogueUseCase(repository: usersRepository) }
    }
    public var fetchQuestStatusUseCase: FetchQuestStatusUseCase {
        shared { DefaultFetchQuestStatusUseCase(repository: usersRepository) }
    }
    public var fetchUserJourneyUseCase: FetchUserJourneyUseCase {
        shared { DefaultFetchUserJourneyUseCase(repository: usersRepository) }
    }
    public var getHelperUseCase: GetHelperUseCase {
        shared { DefaultGetHelperUseCase(repository: usersRepository) }
    }
    public var getUserNameUseCase: GetUserNameUseCase {
        shared { DefaultGetUserNameUseCase(repository: usersRepository) }
    }
    public var setHelperUseCase: SetHelperUseCase {
        shared { DefaultSetHelperUseCase(repository: usersRepository) }
    }
}

// MARK: - Features
extension AppComponent {
    public var splashComponent: SplashComponent {
        SplashComponent(parent: self)
    }
    
    public var mainTabComponent: MainTabComponent {
        MainTabComponent(parent: self)
    }
}

