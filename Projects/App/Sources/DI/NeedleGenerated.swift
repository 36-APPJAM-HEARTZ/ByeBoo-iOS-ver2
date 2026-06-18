

import Data
import DataInterface
import Domain
import DomainInterface
import HomeFeature
import HomeFeatureInterface
import MainTabFeature
import MyPageFeature
import MyPageFeatureInterface
import NeedleFoundation
import QuestFeature
import QuestFeatureInterface
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
private class MainTabDependency2826cdb310ed0b17a725Provider: MainTabDependency {


    init() {

    }
}
/// ^->AppComponent->MainTabComponent
private func factory1ab5a747ddf21e1393f9e3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return MainTabDependency2826cdb310ed0b17a725Provider()
}
private class MyPageDependencyed3a2dbc57f299854a2fProvider: MyPageDependency {


    init() {

    }
}
/// ^->AppComponent->MainTabComponent->MyPageComponent
private func factory58ec266675536a48e110e3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return MyPageDependencyed3a2dbc57f299854a2fProvider()
}
private class HomeDependency69aec7ecd6b5263bd0e9Provider: HomeDependency {


    init() {

    }
}
/// ^->AppComponent->MainTabComponent->HomeComponent
private func factoryd99ae4afe81775bf7b17e3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return HomeDependency69aec7ecd6b5263bd0e9Provider()
}
private class QuestDependency802a1d0aa327823b4d70Provider: QuestDependency {


    init() {

    }
}
/// ^->AppComponent->MainTabComponent->QuestComponent
private func factory86827eb61c66cf97696be3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return QuestDependency802a1d0aa327823b4d70Provider()
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
        localTable["mainTabComponent-MainTabComponent"] = { [unowned self] in self.mainTabComponent as Any }
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
extension MainTabComponent: NeedleFoundation.Registration {
    public func registerItems() {

        localTable["homeComponent-HomeComponent"] = { [unowned self] in self.homeComponent as Any }
        localTable["questComponent-QuestComponent"] = { [unowned self] in self.questComponent as Any }
        localTable["mypageComponent-MyPageComponent"] = { [unowned self] in self.mypageComponent as Any }
    }
}
extension MyPageComponent: NeedleFoundation.Registration {
    public func registerItems() {

    }
}
extension HomeComponent: NeedleFoundation.Registration {
    public func registerItems() {

    }
}
extension QuestComponent: NeedleFoundation.Registration {
    public func registerItems() {

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
    registerProviderFactory("^->AppComponent->MainTabComponent", factory1ab5a747ddf21e1393f9e3b0c44298fc1c149afb)
    registerProviderFactory("^->AppComponent->MainTabComponent->MyPageComponent", factory58ec266675536a48e110e3b0c44298fc1c149afb)
    registerProviderFactory("^->AppComponent->MainTabComponent->HomeComponent", factoryd99ae4afe81775bf7b17e3b0c44298fc1c149afb)
    registerProviderFactory("^->AppComponent->MainTabComponent->QuestComponent", factory86827eb61c66cf97696be3b0c44298fc1c149afb)
}
#endif

public func registerProviderFactories() {
#if !NEEDLE_DYNAMIC
    register1()
#endif
}
