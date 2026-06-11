//
//  BaseViewController.swift
//  ByeBoo-iOS
//
//  Created by 최주리 on 7/4/25.
//

import UIKit

open class BaseViewController: UIViewController {

    open override func viewDidLoad() {
        super.viewDidLoad()

        setView()
        setAddTarget()
        setDelegate()

    }

    open func setView() {}

    open func setAddTarget() {}

    open func setDelegate() {}
}
