//
//  PlayersCardsListView.swift
//  CSTV
//
//  Created by Rafael Nunes Bezerra Dias on 21/07/23.
//

import SwiftUI

struct PlayersCardsListView: View {
    let players: [Player] = [
        Player(name: "Rafael", nickName: "bzradias", photo: ""),
        Player(name: "João", nickName: "Jon", photo: ""),
        Player(name: "Pedro", nickName: "Peter", photo: ""),
        Player(name: "Lucas", nickName: "Lukas", photo: "")]
    
    var body: some View {
        HStack(alignment: .center, spacing: 13) {
            mockPlayersCards
        }
    }
    
    @ViewBuilder
    var mockPlayersCards: some View {
        
        Grid(horizontalSpacing: 13) {
            ForEach(players, id: \.name) { player in
                GridRow {
                    PlayerCardView(cardOrientation: .Left, player: player)
                    PlayerCardView(cardOrientation: .Right, player: player)
                }
            }
        }
    }
}

struct PlayersCardsListView_Previews: PreviewProvider {
    static var previews: some View {
        PlayersCardsListView()
    }
}
