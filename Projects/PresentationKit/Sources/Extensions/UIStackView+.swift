//
//  UIStackView+.swift
//  PresentationKit
//
//  Created by 최주리 on 6/18/26.
//

import UIKit

public extension UIStackView {
    func addArrangedSubviews(_ views: UIView...) {
        views.forEach { self.addArrangedSubview($0) }
    }
}
