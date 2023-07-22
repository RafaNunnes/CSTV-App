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
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 24) {
                        ForEach(matchesViewModel.matchesList) { match in
                            NavigationLink(value: match) {
                                MatchCardView(timeText: match.matchTime, isLive: match.isLive)
                            }
                        }
                    }
                    .padding(.top, 24)
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal, 24)
                }
                .navigationBarTitleDisplayMode(.large)
                .navigationTitle(
                    Text("Partidas")
                        .foregroundColor(ColorPalette.textPrimary)
                )
            }
            .navigationDestination(for: Match.self) { match in
                MatchDetailScreen()
            }
        }
    }
}

struct MatchesListScreen_Previews: PreviewProvider {
    static var previews: some View {
        MatchesListScreen()
    }
}
