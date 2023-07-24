//
//  PlayerCardView.swift
//  CSTV
//
//  Created by Rafael Nunes Bezerra Dias on 21/07/23.
//

import SwiftUI
import Kingfisher

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
    
    var verticalAlignment: SwiftUI.Edge.Set {
        switch self {
        case .Left:
            return .leading
        case .Right:
            return .trailing
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
    
    @ViewBuilder
    private var avatarImage: some View {
        if let playerImage = player.image_url {
            KFImage(URL(string: playerImage))
                .resizable()
                .placeholder { progress in
                    ZStack {
                        Rectangle()
                            .fill(ColorPalette.emptyBackground)
                        if !progress.isFinished {
                            CustomProgressView()
                        }
                    }
                }
        } else {
            ZStack {
                Rectangle()
                    .fill(ColorPalette.emptyBackground)
            }
        }
    }

    var body: some View {
        ZStack(alignment: .topLeading) {
            Rectangle()
                .fill(ColorPalette.cardBackground)
                .cornerRadius(radius: 12, corner: .topLeft)
                .cornerRadius(radius: 12, corner: .bottomLeft)
                .padding(.top, 4)
                
            HStack(alignment: .bottom, spacing: 16) {
                avatarImage
                    .frame(width: 49, height: 49)
                    .cornerRadius(radius: 8, corner: .allCorners)
                
                VStack(alignment: cardOrientation.alignment, spacing: 0) {
                    Text(player.name)
                        .minimumScaleFactor(0.5)
                        .lineLimit(0)
                        .truncationMode(.tail)
                        .foregroundColor(ColorPalette.textPrimary)
                    Text(((player.first_name ?? player.name) + " " + (player.last_name ?? "")))
                        .minimumScaleFactor(0.5)
                        .lineLimit(0)
                        .truncationMode(.tail)
                        .foregroundColor(ColorPalette.textSecondary)
                }
                .padding(cardOrientation.verticalAlignment, 8)
                .scaleEffect(x: cardOrientation.scaleEffect)
            }
            .padding(.leading, 12)
            .padding(.bottom, 8)
        }
        .scaleEffect(x: cardOrientation.scaleEffect)
        .frame(height: 58)
        .fixedSize(horizontal: false, vertical: true)
    }
}
