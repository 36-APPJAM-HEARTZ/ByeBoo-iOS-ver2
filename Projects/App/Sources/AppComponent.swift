import NeedleFoundation

import Data
import DomainInterface
import Domain

final class AppComponent: BootstrapComponent {
    // MARK: - Persistence
    var keychain: KeychainService {
        shared { DefaultKeychainService() }
    }
    
    var userDefaults: UserDefaultService {
        shared { DefaultUserDefaultService() }
    }
    
    
    // MARK: - Network
    var interceptor: NetworkInterceptor {
        shared {
            NetworkInterceptor(
                tokenService: tokenService,
                keychainService: keychain
            )
        }
    }
    
    // MARK: - Service
    var tokenService: TokenService {
        shared { DefaultTokenService(keychainService: keychain) }
    }
    
    var network: NetworkService {
        shared { DefaultNetworkService(interceptor: interceptor) }
    }
    
    // MARK: - Repository
    var blocksRepository: BlocksInterface {
        shared { DefaultBlocksRepository(networkService: network) }
    }
    
    // MARK: - UseCase
    var blockUserUseCase: BlockUserUseCase {
        shared { DefaultBlockUserCase(repository: blocksRepository) }
    }
}

