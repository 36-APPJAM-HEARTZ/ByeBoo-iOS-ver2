
import Foundation

import PresentationKit

@MainActor
public protocol MainTabCoordinatorProtocol: FinishableProtocol {
    func showTabBar()
}
