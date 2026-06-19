
import Foundation

import PresentationKit

@MainActor
public protocol MainTabCoordinatorProtocol: FinishableProtocol {
    func showTabBar()
    func showTutorial()
    func switchTab(to tab: MainTab)
}
