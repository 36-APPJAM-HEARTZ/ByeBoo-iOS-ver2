

import Data
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
    var blockUserUseCase: BlockUserUseCase {
        return appComponent.blockUserUseCase
    }
    private let appComponent: AppDependency
    init(appComponent: AppDependency) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->SplashComponent
private func factoryace9f05f51d68f4c0677f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return SplashDependencye0cb7136f2ec3edfd60aProvider(appComponent: parent1(component) as! AppDependency)
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
        localTable["blockUserUseCase-BlockUserUseCase"] = { [unowned self] in self.blockUserUseCase as Any }
        localTable["splashComponent-SplashComponent"] = { [unowned self] in self.splashComponent as Any }
    }
}
extension SplashComponent: NeedleFoundation.Registration {
    public func registerItems() {
        keyPathToName[\SplashDependency.blockUserUseCase] = "blockUserUseCase-BlockUserUseCase"
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
