//
//  ColorPalette.swift
//  CSTV
//
//  Created by Rafael Nunes Bezerra Dias on 21/07/23.
//

import Foundation
import SwiftUI

struct ColorPalette {
    static var textPrimary: Color {
        return Color(hex: 0xFFFFFF)
    }
    
    static var textSecondary: Color {
        return Color(hex: 0x6C6B7E)
    }
    
    static var subtitle: Color {
        return textPrimary.opacity(0.5)
    }
    
    static var appBackground: Color {
        return Color(hex: 0x161621)
    }
    
    static var cardBackground: Color {
        return Color(hex: 0x272639)
    }
    
    static var emptyBackground: Color {
        return Color(hex: 0xC4C4C4)
    }
    
    static var matchTimeBackground: Color {
        return Color(hex: 0xFAFAFA, alpha: 0.2)
    }
    
    static var matchTimeHighlightBackground: Color {
        return Color(hex: 0xF42A35)
    }
    
    static var dividerBackground: Color {
        return Color(hex: 0xFFFFFF, alpha: 0.2)
    }
}
