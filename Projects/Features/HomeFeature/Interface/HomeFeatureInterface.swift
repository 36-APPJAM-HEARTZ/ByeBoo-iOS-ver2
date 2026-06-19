
import Foundation

import PresentationKit

@MainActor
public protocol HomeCoordinatorProtocol: FinishableProtocol {
    func showHome()
    func showTutorial()
    func showNotice(isExist: Bool)
    func showQuestTab()
}
