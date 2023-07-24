//
//  MatchDetailScreen.swift
//  CSTV
//
//  Created by Rafael Nunes Bezerra Dias on 20/07/23.
//

import SwiftUI

struct MatchDetailScreen: View {
    @Environment(\.presentationMode) var presentation
    let match: Match
    
    var body: some View {
        ZStack {
            ColorPalette.appBackground.ignoresSafeArea()
            
            VStack(alignment: .center, spacing: 20) {
                TeamsContainerView(firstTeam: match.firstTeam(), secondTeam: match.secondTeam())
                
                Text(match.getMatchDate())
                    .foregroundColor(ColorPalette.textPrimary)
                
                ScrollView(showsIndicators: false) {
                    PlayersCardsListView()
                }
            }
            .padding(.top, 24)
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("\(match.league.name) \(match.serie.full_name)")
            .navigationBarBackButtonHidden()
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarLeading) {
                    Image("CustomBackButtonIcon")
                        .onTapGesture {
                            self.presentation.wrappedValue.dismiss()
                        }
                }
            })
        }
    }
}

