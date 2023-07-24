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
        VStack(alignment: .center, spacing: 0) {
            customNavBar
            
            ZStack {
                ColorPalette.appBackground.ignoresSafeArea()
                
                VStack(alignment: .center, spacing: 20) {
                    TeamsContainerView(firstTeam: viewModel.firstTeam(), secondTeam: viewModel.secondTeam())
                    
                    Text(viewModel.getMatchDate())
                        .foregroundColor(ColorPalette.textPrimary)
                    if viewModel.isSearching {
                        Spacer()
                        CustomProgressView()
                        Spacer()
                    } else {
                        ScrollView(showsIndicators: false) {
                            PlayersCardsListView(viewModel: viewModel)
                        }
                    }
                }
                .padding(.top, 24)
            }
            .navigationBarBackButtonHidden()
            .task {
                await viewModel.fetchPlayersList()
            }
        }
        .background(ColorPalette.appBackground.ignoresSafeArea())
    }
    
    private var customNavBar: some View {
        ZStack(alignment: .center) {
            HStack(alignment: .bottom, spacing: 0) {
                Image("CustomBackButtonIcon")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .padding(.leading, 24)
                    .padding(.top, 32)
                    .onTapGesture {
                        self.presentation.wrappedValue.dismiss()
                    }
                Spacer()
            }
            
            Text("\(viewModel.match.league.name) \(viewModel.match.serie.full_name)")
                .foregroundColor(ColorPalette.textPrimary)
                .padding(.top, 32)
                .padding(.horizontal, 48)
        }
    }
}

