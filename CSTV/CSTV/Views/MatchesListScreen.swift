//
//  MatchesListView.swift
//  CSTV
//
//  Created by Rafael Nunes Bezerra Dias on 20/07/23.
//

import SwiftUI

struct MatchesListScreen: View {
    @State private var path: NavigationPath = NavigationPath()
    
    @StateObject private var viewModel: MatchesViewModel = MatchesViewModel()
    
    var body: some View {
        NavigationStack(path: $path) {
            ZStack {
                ColorPalette.appBackground.ignoresSafeArea()
                
                if viewModel.isSearching {
                    ProgressView()
                } else {
                    ScrollView(showsIndicators: false) {
                        VStack(spacing: 24) {
                            ForEach(viewModel.runningMatchesList, id: \.id) { match in
                                NavigationLink(value: match) {
                                    MatchCardView(viewModel: MatchDetailViewModel(match: match), isLive: true)
                                }
                            }
                            
                            ForEach(viewModel.upcomingMatchesList, id: \.id) { match in
                                NavigationLink(value: match) {
                                    MatchCardView(viewModel: MatchDetailViewModel(match: match), isLive: false)
                                }
                            }
                        }
                        .padding(.top, 24)
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal, 24)
                    }
                    .refreshable {
                        await viewModel.refresh()
                    }
                }
            }
            .navigationBarTitleDisplayMode(.large)
            .navigationTitle("Partidas")
            .navigationDestination(for: Match.self) { match in
                MatchDetailScreen(viewModel: MatchDetailViewModel(match: match))
            }
        }
        .task {
            await viewModel.fetchMatchesList()
        }
    }
}

struct MatchesListScreen_Previews: PreviewProvider {
    static var previews: some View {
        MatchesListScreen()
    }
}
