//
//  LeagueContainerView.swift
//  CSTV
//
//  Created by Rafael Nunes Bezerra Dias on 21/07/23.
//

import SwiftUI

struct LeagueContainerView: View {
    var leagueName: String
    
    var body: some View {
        HStack(alignment: .center, spacing: 8) {
            RoundedCornerShape(radius: 8, corner: .allCorners)
                .fill(ColorPalette.emptyBackground)
                .frame(width: 16, height: 16)
            Text(leagueName)
                .foregroundColor(ColorPalette.textPrimary)
                .lineLimit(0)
        }
    }
}

struct LeagueContainerView_Previews: PreviewProvider {
    static var previews: some View {
        LeagueContainerView(leagueName: "League + serie")
            .padding()
            .background(ColorPalette.cardBackground)
    }
}
