//
//  MatchCardView.swift
//  CSTV
//
//  Created by Rafael Nunes Bezerra Dias on 21/07/23.
//

import SwiftUI

struct MatchCardView: View {
    let viewModel: MatchDetailViewModel
    let isLive: Bool
    
    var body: some View {
        ZStack(alignment: .center) {
            
            ColorPalette.cardBackground
            
            VStack(alignment: .leading, spacing: 0) {
                
                VStack(alignment: .center, spacing: 0) {
                    
                    HStack(alignment: .top) {
                        Spacer()
                        MatchTimeView(timeText: viewModel.getMatchDate(), isLive: isLive)
                    }
                    .frame(height: 25)
                    TeamsContainerView(firstTeam: viewModel.firstTeam(), secondTeam: viewModel.secondTeam())
                        .padding(.vertical, 18.5)
                        .padding(.horizontal, 73.5)
                }
                
                Divider()
                    .frame(height: 1)
                    .background(ColorPalette.dividerBackground)
                
                LeagueContainerView(match: viewModel.match)
                    .padding(.vertical, 8)
                    .padding(.leading, 16)
                    .frame(height: 32)
            }
            .fixedSize(horizontal: false, vertical: true)
        }
        .cornerRadius(radius: 16, corner: .allCorners)
    }
}
