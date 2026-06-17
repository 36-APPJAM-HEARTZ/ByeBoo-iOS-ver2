

import Data
import DataInterface
import Domain
import DomainInterface
import NeedleFoundation
import SplashFeature
import UIKit

// swiftlint:disable unused_declaration
private let needleDependenciesHash : String? = nil

// MARK: - Traversal Helpers

private func parent1(_ component: NeedleFoundation.Scope) -> NeedleFoundation.Scope {
    return component.parent
}

// MARK: - Providers

#if !NEEDLE_DYNAMIC

private class SplashDependencye0cb7136f2ec3edfd60aProvider: SplashDependency {
    var autoLoginUseCase: AutoLoginUseCase {
        return appComponent.autoLoginUseCase
    }
    var getIsRegisteredUseCase: GetIsRegisteredUseCase {
        return appComponent.getIsRegisteredUseCase
    }
    var socialLoginUseCase: SocialLoginUseCase {
        return appComponent.socialLoginUseCase
    }
    var getUserIDUseCase: GetUserIDUseCase {
        return appComponent.getUserIDUseCase
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->SplashComponent
private func factoryace9f05f51d68f4c0677f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return SplashDependencye0cb7136f2ec3edfd60aProvider(appComponent: parent1(component) as! AppComponent)
}

#else
extension AppComponent: NeedleFoundation.Registration {
    public func registerItems() {

        localTable["keychain-KeychainService"] = { [unowned self] in self.keychain as Any }
        localTable["userDefaults-UserDefaultService"] = { [unowned self] in self.userDefaults as Any }
        localTable["interceptor-NetworkInterceptor"] = { [unowned self] in self.interceptor as Any }
        localTable["tokenService-TokenService"] = { [unowned self] in self.tokenService as Any }
        localTable["network-NetworkService"] = { [unowned self] in self.network as Any }
        localTable["blocksRepository-BlocksInterface"] = { [unowned self] in self.blocksRepository as Any }
        localTable["authRepository-AuthInterface"] = { [unowned self] in self.authRepository as Any }
        localTable["usersRepository-UsersInterface"] = { [unowned self] in self.usersRepository as Any }
        localTable["blockUserUseCase-BlockUserUseCase"] = { [unowned self] in self.blockUserUseCase as Any }
        localTable["autoLoginUseCase-AutoLoginUseCase"] = { [unowned self] in self.autoLoginUseCase as Any }
        localTable["getIsRegisteredUseCase-GetIsRegisteredUseCase"] = { [unowned self] in self.getIsRegisteredUseCase as Any }
        localTable["getUserIDUseCase-GetUserIDUseCase"] = { [unowned self] in self.getUserIDUseCase as Any }
        localTable["socialLoginUseCase-SocialLoginUseCase"] = { [unowned self] in self.socialLoginUseCase as Any }
        localTable["splashComponent-SplashComponent"] = { [unowned self] in self.splashComponent as Any }
    }
}
extension SplashComponent: NeedleFoundation.Registration {
    public func registerItems() {
        keyPathToName[\SplashDependency.autoLoginUseCase] = "autoLoginUseCase-AutoLoginUseCase"
        keyPathToName[\SplashDependency.getIsRegisteredUseCase] = "getIsRegisteredUseCase-GetIsRegisteredUseCase"
        keyPathToName[\SplashDependency.socialLoginUseCase] = "socialLoginUseCase-SocialLoginUseCase"
        keyPathToName[\SplashDependency.getUserIDUseCase] = "getUserIDUseCase-GetUserIDUseCase"
    }
}


#endif

private func factoryEmptyDependencyProvider(_ component: NeedleFoundation.Scope) -> AnyObject {
    return EmptyDependencyProvider(component: component)
}

// MARK: - Registration
private func registerProviderFactory(_ componentPath: String, _ factory: @escaping (NeedleFoundation.Scope) -> AnyObject) {
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: componentPath, factory)
}

#if !NEEDLE_DYNAMIC

@inline(never) private func register1() {
    registerProviderFactory("^->AppComponent", factoryEmptyDependencyProvider)
    registerProviderFactory("^->AppComponent->SplashComponent", factoryace9f05f51d68f4c0677f47b58f8f304c97af4d5)
}
#endif

public func registerProviderFactories() {
#if !NEEDLE_DYNAMIC
    register1()
#endif
}
