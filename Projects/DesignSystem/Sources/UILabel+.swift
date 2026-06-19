//
//  UILabel+.swift
//  DesignSystem
//
//  Created by 최주리 on 6/19/26.
//

import UIKit

public extension UILabel {
    func applyByeBooFont(
        style: FontManager,
        text: String? = nil,
        color: UIColor,
        textAlignment: NSTextAlignment? = nil,
        numberOfLines: Int? = nil
    ) {
        if let text { self.text = text }
        self.textColor = color
        if let textAlignment { self.textAlignment = textAlignment }
        if let numberOfLines { self.numberOfLines = numberOfLines }
        
        let targetText = text ?? self.text
        
        guard let targetText else { return }
        
        var attributes = style.attributes
        
        let paragraphStyle = (attributes[.paragraphStyle] as? NSParagraphStyle)?.mutableCopy() as? NSMutableParagraphStyle ?? NSMutableParagraphStyle()
        paragraphStyle.alignment = self.textAlignment
        attributes[.paragraphStyle] = paragraphStyle
        
        attributes[.foregroundColor] = color
        
        attributedText = NSAttributedString(string: targetText, attributes: attributes)
    }
}
