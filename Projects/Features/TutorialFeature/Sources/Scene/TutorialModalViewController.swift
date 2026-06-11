//
//  TutorialModalViewController.swift
//  ByeBoo-iOS
//
//  Created by APPLE on 8/23/25.
//

import Mixpanel

import PresentationKit
import DesignSystem

public final class TutorialModalViewController: BaseViewController {
    
    private let rootView = TutorialModalView()
    
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
