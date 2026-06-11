//
//  TutorialModalViewController.swift
//  ByeBoo-iOS
//
//  Created by APPLE on 8/23/25.
//

import Mixpanel

import PresentationKit

public final class TutorialModalViewController: BaseViewController {
    
    private let rootView = TutorialModalView()
    
    public override func loadView() {
        view = rootView
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
//        ByeBooNavigationBar.makeNavigationBar(
//            navigationItem: self.navigationItem,
//            navigationController: self.navigationController,
//            type: .close(header: .black),
//            action: #selector(back)
//        )
//        
        Mixpanel.mainInstance().track(event: TutorialEvents.Name.tutorialPageView)
    }
    
    public override func viewWillDisappear(_ animated: Bool) {
//        ByeBooNavigationBar.makeNavigationBar(
//            navigationItem: self.navigationItem,
//            navigationController: self.navigationController,
//            type: .none(),
//            action: #selector(back)
//        )
    }
}

//extension TutorialModalViewController: BackNavigable {
//    
//    func back() {
//        self.navigationController?.popViewController(animated: false)
//    }
//}
