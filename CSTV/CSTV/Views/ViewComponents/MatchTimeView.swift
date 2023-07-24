//
//  MatchTimeView.swift
//  CSTV
//
//  Created by Rafael Nunes Bezerra Dias on 21/07/23.
//

import SwiftUI

struct MatchTimeView: View {
    var timeText: String
    var isLive: Bool
    
    private var backgroundColor: Color {
        return isLive ? ColorPalette.matchTimeHighlightBackground : ColorPalette.matchTimeBackground
    }
    
    private var timeInputText: String {
        return isLive ? "AGORA" : timeText
    }
    
    var body: some View {
        Text(timeInputText)
            .foregroundColor(ColorPalette.textPrimary)
            .font(Fonts.boldSmallLabel)
            .padding(8)
            .background(backgroundColor)
            .cornerRadius(radius: 16, corner: .bottomLeft)
            .minimumScaleFactor(0.5)
            .truncationMode(.tail)
    }
}

struct MatchTimeView_Previews: PreviewProvider {
    static var previews: some View {
        MatchTimeView(timeText: "Hoje, 21:00", isLive: false)
            .padding()
            .background(ColorPalette.cardBackground)
    }
}
