//
//  PlayerCardView.swift
//  CSTV
//
//  Created by Rafael Nunes Bezerra Dias on 21/07/23.
//

import SwiftUI

enum PlayerCardOrientation {
    case Left
    case Right
    
    var alignment: HorizontalAlignment {
        switch self {
        case .Left:
            return .trailing
        case .Right:
            return .leading
        }
    }
    
    var scaleEffect: CGFloat {
        switch self {
        case .Left:
            return -1
        case .Right:
            return 1
        }
    }
}

struct PlayerCardView: View {
    var cardOrientation: PlayerCardOrientation
    var player: Player

    var body: some View {
        ZStack(alignment: .topLeading) {
            Rectangle()
                .fill(ColorPalette.cardBackground)
                .cornerRadius(radius: 12, corner: .topLeft)
                .cornerRadius(radius: 12, corner: .bottomLeft)
                .padding(.top, 4)
                
            HStack(alignment: .bottom, spacing: 16) {
                RoundedCornerShape(radius: 8, corner: .allCorners)
                    .fill(ColorPalette.emptyBackground)
                    .frame(width: 49, height: 49)
                
                VStack(alignment: cardOrientation.alignment, spacing: 0) {
                    Text(player.nickName)
                        .foregroundColor(ColorPalette.textPrimary)
                    Text(player.name)
                        .foregroundColor(ColorPalette.textSecondary)
                }
                .scaleEffect(x: cardOrientation.scaleEffect)
            }
            .padding(.leading, 12)
            .padding(.bottom, 8)
        }
        .scaleEffect(x: cardOrientation.scaleEffect)
    }
}

struct PlayerCardView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerCardView(cardOrientation: .Left, player: Player(name: "Nome do Jogador", nickName: "Nickname", photoPath: ""))
            .frame(width: 174, height: 54)
    }
}
