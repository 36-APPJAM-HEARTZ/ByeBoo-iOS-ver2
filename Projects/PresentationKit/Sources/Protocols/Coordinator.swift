//
//  Coordinator.swift
//  PresentationKit
//
//  Created by 최주리 on 6/16/26.
//

public protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    func start()
}

public extension Coordinator {
    func add(child: Coordinator) {
        childCoordinators.append(child)
    }
    
    func remove(child: Coordinator) {
        childCoordinators.removeAll { $0 === child }
    }
}

public protocol FinishableProtocol: AnyObject {
    var finished: (() -> Void)? { get set }
}
