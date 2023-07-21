//
//  MatchDetailScreen.swift
//  CSTV
//
//  Created by Rafael Nunes Bezerra Dias on 20/07/23.
//

import SwiftUI

struct MatchDetailScreen: View {
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            TeamsContainerView(firstTeamName: "Time 1", secondTeamName: "Time 2")
            
            Text("Hoje, 21:00")
                .foregroundColor(ColorPalette.textPrimary)
            
            ScrollView(showsIndicators: false) {
                PlayersCardsListView()
            }
        }
        .padding(.top, 24)
        .navigationBarTitleDisplayMode(.large)
        .navigationTitle("League + serie")
    }
}

struct MatchDetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            ColorPalette.appBackground.ignoresSafeArea()
            MatchDetailScreen()
        }
    }
}
