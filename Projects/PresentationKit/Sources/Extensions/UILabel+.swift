//
//  UILabel+.swift
//  ByeBoo-iOS
//
//  Created by 최주리 on 7/8/25.
//

import UIKit

import DesignSystem

public extension UILabel {
    func underLine(text: String) {
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttributes([
            NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue,
            .baselineOffset: 3
        ], range: NSString(string: text).range(of: text))
        self.attributedText = attributedString
    }
    
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
