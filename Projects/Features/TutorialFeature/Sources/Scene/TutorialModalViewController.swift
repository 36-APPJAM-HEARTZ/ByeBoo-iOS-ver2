//
//  TutorialModalViewController.swift
//  ByeBoo-iOS
//
//  Created by APPLE on 8/23/25.
//

import Foundation

import Mixpanel

import PresentationKit
import DesignSystem
import TutorialFeatureInterface

public final class TutorialModalViewController: BaseViewController {
    
    private weak var coordinator: TutorialCoordinatorProtocol?
    
    private let rootView = TutorialModalView()
    
    public init(coordinator: TutorialCoordinatorProtocol? = nil) {
        self.coordinator = coordinator
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func loadView() {
        view = rootView
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        Mixpanel.mainInstance().track(event: TutorialEvents.Name.tutorialPageView)
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        ByeBooNavigationBar.makeNavigationBar(
            navigationItem: self.navigationItem,
            navigationController: self.navigationController,
            type: .close(header: .black),
            target: self,
//            action: #selector(back)
        )
    }
    
    public override func viewWillDisappear(_ animated: Bool) {
        ByeBooNavigationBar.makeNavigationBar(
            navigationItem: self.navigationItem,
            navigationController: self.navigationController,
            type: .none(),
            target: self,
//            action: #selector(back)
        )
    }
}

// TODO: - coordinator로 변경 하기

//extension TutorialModalViewController: BackNavigable {
//    
//    func back() {
//        self.navigationController?.popViewController(animated: false)
//    }
//}
