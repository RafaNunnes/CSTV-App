//
//  MatchDetailScreen.swift
//  CSTV
//
//  Created by Rafael Nunes Bezerra Dias on 20/07/23.
//

import SwiftUI

struct MatchDetailScreen: View {
    @Environment(\.presentationMode) var presentation
    
    @StateObject var viewModel: MatchDetailViewModel
    
    var body: some View {
        ZStack {
            ColorPalette.appBackground.ignoresSafeArea()
            
            VStack(alignment: .center, spacing: 20) {
                TeamsContainerView(firstTeam: viewModel.firstTeam(), secondTeam: viewModel.secondTeam())
                
                Text(viewModel.getMatchDate())
                    .foregroundColor(ColorPalette.textPrimary)
                
                ScrollView(showsIndicators: false) {
                    PlayersCardsListView()
                }
            }
            .padding(.top, 24)
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("\(viewModel.match.league.name) \(viewModel.match.serie.full_name)")
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

