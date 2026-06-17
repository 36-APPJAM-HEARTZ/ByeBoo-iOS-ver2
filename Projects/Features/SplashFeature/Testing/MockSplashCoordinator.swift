import Core
import SplashFeatureInterface

public final class MockSplashCoordinator: SplashCoordinatorProtocol {
    public func showSplash() {
        ByeBooLogger.debug("show splash")
    }
    
    public func showLogin() {
        ByeBooLogger.debug("show login")
    }
    
    public var finished: (() -> Void)?
}
