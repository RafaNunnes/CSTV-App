//
//  MatchesListView.swift
//  CSTV
//
//  Created by Rafael Nunes Bezerra Dias on 20/07/23.
//

import SwiftUI

struct MatchesListScreen: View {
    @State private var path: NavigationPath = NavigationPath()
    
    @ObservedObject private var matchesViewModel: MatchViewModel = MatchViewModel()
    
    var body: some View {
        NavigationStack(path: $path) {
            ZStack {
                ColorPalette.appBackground.ignoresSafeArea()
                
                if matchesViewModel.isSearching {
                    ProgressView()
                } else {
                    ScrollView(showsIndicators: false) {
                        VStack(spacing: 24) {
                            ForEach(matchesViewModel.runningMatchesList, id: \.id) { match in
                                NavigationLink(value: match) {
                                    MatchCardView(match: match, isLive: true)
                                }
                            }
                            ForEach(matchesViewModel.upcomingMatchesList, id: \.id) { match in
                                NavigationLink(value: match) {
                                    MatchCardView(match: match, isLive: false)
                                }
                            }
                        }
                        .padding(.top, 24)
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal, 24)
                    }
                    .refreshable {
                        await matchesViewModel.refresh()
                    }
                }
            }
            .navigationBarTitleDisplayMode(.large)
            .navigationTitle("Partidas")
            .navigationDestination(for: Match.self) { match in
                MatchDetailScreen(match: match)
            }
        }
        .task {
            await matchesViewModel.fetchMatchesList()
        }
    }
}

struct MatchesListScreen_Previews: PreviewProvider {
    static var previews: some View {
        MatchesListScreen()
    }
}
