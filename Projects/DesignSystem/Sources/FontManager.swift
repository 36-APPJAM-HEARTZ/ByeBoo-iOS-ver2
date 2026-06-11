
import UIKit

public enum FontManager {
    case head1M24
    case head2M22

    case sub1Sb20
    case sub2Sb18
    case sub3M18
    case sub4R18

    case body1Sb16
    case body2M16
    case body3R16
    case body4Sb14
    case body5M14
    case body6R14

    case cap1M12
    case cap2R12

    case boriVoiceR18
}

// MARK: - Public

public extension FontManager {
    var font: UIFont {
        property.fontType.font(size: property.size)
    }

    var lineHeight: CGFloat {
        property.size * (property.lineHeight / 100.0)
    }

    var letterSpacing: CGFloat {
        property.size * (property.kern / 100.0)
    }

    var attributes: [NSAttributedString.Key: Any] {
        [
            .font: font,
            .kern: letterSpacing,
            .paragraphStyle: {
                let style = NSMutableParagraphStyle()
                style.minimumLineHeight = lineHeight
                style.maximumLineHeight = lineHeight
                return style
            }()
        ]
    }
}

// MARK: - Private

private extension FontManager {
    struct FontProperty {
        let fontType: DesignSystemFontConvertible
        let size: CGFloat
        let lineHeight: CGFloat
        let kern: CGFloat
    }

    var property: FontProperty {
        switch self {
        case .head1M24:  return FontProperty(fontType: DesignSystemFontFamily.Pretendard.medium, size: 24, lineHeight: 130, kern: -1)
        case .head2M22:  return FontProperty(fontType: DesignSystemFontFamily.Pretendard.medium, size: 22, lineHeight: 120, kern: -1)

        case .sub1Sb20:  return FontProperty(fontType: DesignSystemFontFamily.Pretendard.semiBold, size: 20, lineHeight: 120, kern: -1)
        case .sub2Sb18:  return FontProperty(fontType: DesignSystemFontFamily.Pretendard.semiBold, size: 18, lineHeight: 120, kern: -1)
        case .sub3M18:   return FontProperty(fontType: DesignSystemFontFamily.Pretendard.medium,   size: 18, lineHeight: 120, kern: -1)
        case .sub4R18:   return FontProperty(fontType: DesignSystemFontFamily.Pretendard.regular,  size: 18, lineHeight: 120, kern: -1)

        case .body1Sb16: return FontProperty(fontType: DesignSystemFontFamily.Pretendard.semiBold, size: 16, lineHeight: 130, kern: -1)
        case .body2M16:  return FontProperty(fontType: DesignSystemFontFamily.Pretendard.medium,   size: 16, lineHeight: 130, kern: -1)
        case .body3R16:  return FontProperty(fontType: DesignSystemFontFamily.Pretendard.regular,  size: 16, lineHeight: 150, kern: -1)
        case .body4Sb14: return FontProperty(fontType: DesignSystemFontFamily.Pretendard.semiBold, size: 14, lineHeight: 150, kern: -1)
        case .body5M14:  return FontProperty(fontType: DesignSystemFontFamily.Pretendard.medium,   size: 14, lineHeight: 150, kern: -1)
        case .body6R14:  return FontProperty(fontType: DesignSystemFontFamily.Pretendard.regular,  size: 14, lineHeight: 150, kern: -1)

        case .cap1M12:   return FontProperty(fontType: DesignSystemFontFamily.Pretendard.medium,  size: 12, lineHeight: 130, kern: -1)
        case .cap2R12:   return FontProperty(fontType: DesignSystemFontFamily.Pretendard.regular, size: 12, lineHeight: 130, kern: -1)

        case .boriVoiceR18: return FontProperty(fontType: DesignSystemFontFamily.OmyuPretty.regular, size: 18, lineHeight: 150, kern: 0)
        }
    }
}
