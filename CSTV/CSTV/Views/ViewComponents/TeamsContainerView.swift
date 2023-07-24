//
//  TeamsContainerView.swift
//  CSTV
//
//  Created by Rafael Nunes Bezerra Dias on 21/07/23.
//

import SwiftUI

struct TeamsContainerView: View {
    var firstTeam: Team?
    var secondTeam: Team?
    
    var body: some View {
        HStack(alignment: .top) {
            TeamView(team: firstTeam)
            
            Text("VS")
                .foregroundColor(ColorPalette.subtitle)
                .font(Fonts.largeLabel)
                .padding(.horizontal, 20)
                .padding(.top, 34)
                .fixedSize()
            
            TeamView(team: secondTeam)
        }
    }
}
