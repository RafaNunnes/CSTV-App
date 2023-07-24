//
//  Fonts.swift
//  CSTV
//
//  Created by Rafael Nunes Bezerra Dias on 24/07/23.
//

import Foundation
import SwiftUI

struct Fonts {
    private enum FontWeightName: String {
        /// Weight: 300
        case light = "Roboto-Light"
        /// Weight: 400
        case regular = "Roboto-Regular"
        /// Weight: 500
        case medium = "Roboto-Medium"
        /// Weight: 700
        case bold = "Roboto-Bold"
    }
    
    private enum FontSize: CGFloat {
        /// size: 8
        case LabelSmall = 8
        /// size: 10
        case LabelMedium = 10
        /// size: 12
        case LabelLarge = 12
        
        /// size: 14
        case BodySmall = 14
        /// size: 16
        case BodyLarge = 16
        
        /// size: 18
        case TitleSmall = 18
        /// size: 24
        case TitleLarge = 24
        /// size: 32
        case TitleXLarge = 32
        
        /// size: 40
        case DisplaySmall = 40
        /// size: 48
        case DisplayLarge = 48
    }
    
    static var largeTitle: Font {
        return Font.custom(FontWeightName.medium.rawValue, size: FontSize.TitleXLarge.rawValue)
    }
    
    static var smallTitle: Font {
        return Font.custom(FontWeightName.medium.rawValue, size: FontSize.TitleSmall.rawValue)
    }
    
    static var boldSmallLabel: Font {
        return Font.custom(FontWeightName.bold.rawValue, size: FontSize.LabelSmall.rawValue)
    }

    static var mediumLabel: Font {
        return Font.custom(FontWeightName.regular.rawValue, size: FontSize.LabelMedium.rawValue)
    }
    
    static var largeLabel: Font {
        return Font.custom(FontWeightName.regular.rawValue, size: FontSize.LabelLarge.rawValue)
    }
    
    static var smallLabel: Font {
        return Font.custom(FontWeightName.regular.rawValue, size: FontSize.LabelSmall.rawValue)
    }
    
    static var boldLargeLabel: Font {
        return Font.custom(FontWeightName.bold.rawValue, size: FontSize.LabelLarge.rawValue)
    }
    
    static var boldSmallBody: Font {
        return Font.custom(FontWeightName.bold.rawValue, size: FontSize.BodySmall.rawValue)
    }
}
