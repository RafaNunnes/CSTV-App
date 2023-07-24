//
//  PlayersCardsListView.swift
//  CSTV
//
//  Created by Rafael Nunes Bezerra Dias on 21/07/23.
//

import SwiftUI

struct PlayersCardsListView: View {
    @ObservedObject var viewModel: MatchDetailViewModel
    
    var body: some View {
        HStack(alignment: .top, spacing: 13) {
            VStack(spacing: 13) {
                ForEach(viewModel.firstTeamPlayers, id: \.id) { player in
                    PlayerCardView(cardOrientation: .Left, player: player)
                }
            }
            VStack(spacing: 13) {
                ForEach(viewModel.secondTeamPlayers, id: \.id) { player in
                    PlayerCardView(cardOrientation: .Right, player: player)
                }
            }
        }
    }
}
