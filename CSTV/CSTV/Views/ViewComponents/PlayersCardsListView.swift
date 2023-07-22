//
//  PlayersCardsListView.swift
//  CSTV
//
//  Created by Rafael Nunes Bezerra Dias on 21/07/23.
//

import SwiftUI

struct PlayersCardsListView: View {
    let players: [Player] = [
        Player(name: "Rafael", nickName: "bzradias", photoPath: ""),
        Player(name: "João", nickName: "Jon", photoPath: ""),
        Player(name: "Pedro", nickName: "Peter", photoPath: ""),
        Player(name: "Mateus", nickName: "Matt", photoPath: ""),
        Player(name: "Lucas", nickName: "Lukas", photoPath: "")]
    
    private let columnItens: [GridItem] = [
        GridItem(.flexible(), spacing: 13),
        GridItem(.flexible(), spacing: 13)
    ]
    
    var body: some View {
        LazyVGrid(columns: columnItens, alignment: .center, spacing: 13) {
            ForEach((0..<players.count), id: \.self) { index in
                PlayerCardView(cardOrientation: cardOrientationByIndex(index), player: players[index])
            }
        }
    }
    
    private func cardOrientationByIndex(_ index: Int) -> PlayerCardOrientation {
        return index % 2 == 0 ? .Left : .Right
    }
}

struct PlayersCardsListView_Previews: PreviewProvider {
    static var previews: some View {
        PlayersCardsListView()
    }
}
