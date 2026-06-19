//
//  UIButton+.swift
//  DesignSystem
//
//  Created by 최주리 on 6/19/26.
//

import UIKit

public extension UIButton {
    func applyByeBooFont(
        style: FontManager,
        text: String? = nil,
        color: UIColor,
        for state: UIControl.State = .normal
    ) {
        let targetText = text ?? title(for: state)
        guard let targetText = targetText else { return }
        
        var attributes = style.attributes
        
        attributes[.foregroundColor] = color
        
        setAttributedTitle(
            NSAttributedString(string: targetText, attributes: attributes),
            for: state
        )
    }
}
