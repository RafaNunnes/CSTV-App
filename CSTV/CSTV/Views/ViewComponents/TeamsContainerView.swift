//
//  TeamsContainerView.swift
//  CSTV
//
//  Created by Rafael Nunes Bezerra Dias on 21/07/23.
//

import SwiftUI

struct TeamsContainerView: View {
    var firstTeamName: String
    var secondTeamName: String
    
    var body: some View {
        HStack(alignment: .top) {
            TeamView(teamName: firstTeamName)
            
            Text("VS")
                .padding(.horizontal, 20)
                .padding(.top, 34)
                .foregroundColor(ColorPalette.subtitle)
                .fixedSize()
            
            TeamView(teamName: secondTeamName)
        }
    }
}

struct TeamsContainerView_Previews: PreviewProvider {
    static var previews: some View {
        TeamsContainerView(firstTeamName: "Team 1", secondTeamName: "Team 2")
            .padding()
            .background(ColorPalette.cardBackground)
    }
}
