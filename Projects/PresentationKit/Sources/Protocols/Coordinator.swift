//
//  Coordinator.swift
//  PresentationKit
//
//  Created by 최주리 on 6/16/26.
//

/// 화면 전환 로직을 관리하는 코디네이터 프로토콜입니다.
/// 모든 코디네이터는 이 프로토콜을 상속받아 일관된 생명주기 관리를 수행해야 합니다.
@MainActor
public protocol Coordinator: AnyObject {
    /// 자식 코디네이터를 관리하는 배열입니다. 메모리에서 해제되지 않도록 유지합니다.
    var childCoordinators: [Coordinator] { get set }
    
    /// 코디네이터의 동작을 시작합니다. 일반적으로 첫 번째 화면을 생성하고 노출합니다.
    func start()
}

public extension Coordinator {
    /// 자식 코디네이터를 배열에 추가합니다.
    func add(child: Coordinator) {
        childCoordinators.append(child)
    }
    
    /// 자식 코디네이터를 배열에서 제거합니다.
    func remove(child: Coordinator) {
        childCoordinators.removeAll { $0 === child }
    }
}

/// 자식 코디네이터가 작업 완료 후 부모에게 신호를 보낼 때 사용하는 프로토콜입니다.
@MainActor
public protocol FinishableProtocol: AnyObject {
    /// 작업이 완료되었을 때 호출될 클로저입니다. 부모 코디네이터가 자식을 해제하는 로직을 담습니다.
    var finished: (() -> Void)? { get set }
}

