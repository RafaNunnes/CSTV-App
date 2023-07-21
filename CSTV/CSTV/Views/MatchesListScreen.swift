//
//  MatchesListView.swift
//  CSTV
//
//  Created by Rafael Nunes Bezerra Dias on 20/07/23.
//

import SwiftUI

struct MatchesListScreen: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 24) {
                getMockView()
            }
            .padding(.top, 24)
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 24)
        }
        .navigationBarTitleDisplayMode(.large)
        .navigationTitle("Partidas")
    }
    
    @ViewBuilder
    func getMockView() -> some View {
        MatchCardView(timeText: "Hoje, 21:00", isLive: true)
        MatchCardView(timeText: "Hoje, 21:00", isLive: false)
        MatchCardView(timeText: "Hoje, 21:00", isLive: true)
        MatchCardView(timeText: "Hoje, 21:00", isLive: false)
        MatchCardView(timeText: "Hoje, 21:00", isLive: true)
        MatchCardView(timeText: "Hoje, 21:00", isLive: false)
        MatchCardView(timeText: "Hoje, 21:00", isLive: true)
        MatchCardView(timeText: "Hoje, 21:00", isLive: false)
    }
}

struct MatchesListScreen_Previews: PreviewProvider {
    static var previews: some View {
        MatchesListScreen()
    }
}
