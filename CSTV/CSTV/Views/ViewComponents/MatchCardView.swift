//
//  MatchCardView.swift
//  CSTV
//
//  Created by Rafael Nunes Bezerra Dias on 21/07/23.
//

import SwiftUI

struct MatchCardView: View {
    var timeText: String
    var isLive: Bool
    
    var body: some View {
        ZStack(alignment: .center) {
            
            ColorPalette.cardBackground
            
            VStack(alignment: .leading, spacing: 0) {
                
                VStack(alignment: .center, spacing: 0) {
                    
                    HStack(alignment: .top) {
                        Spacer()
                        MatchTimeView(timeText: timeText, isLive: isLive)
                    }
                    .frame(height: 25)
                    TeamsContainerView(firstTeamName: "Time 1", secondTeamName: "Time 2")
                        .padding(.vertical, 18.5)
                        .padding(.horizontal, 73.5)
                }
                
                Divider()
                    .frame(height: 1)
                    .background(ColorPalette.dividerBackground)
                
                LeagueContainerView(leagueName: "League + serie")
                    .padding(.vertical, 8)
                    .padding(.leading, 16)
                    .frame(height: 32)
            }
        }
        .cornerRadius(radius: 16, corner: .allCorners)
    }
}

struct MatchCardView_Previews: PreviewProvider {
    static var previews: some View {
        MatchCardView(timeText: "Hoje, 21:00", isLive: true)
    }
}
