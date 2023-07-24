//
//  LeagueContainerView.swift
//  CSTV
//
//  Created by Rafael Nunes Bezerra Dias on 21/07/23.
//

import SwiftUI
import Kingfisher

struct LeagueContainerView: View {
    var match: Match
    
    @ViewBuilder
    private var avatarImage: some View {
        if let leagueImage = match.league.image_url {
            KFImage(URL(string: leagueImage))
                .resizable()
                .placeholder { progress in
                    ZStack {
                        RoundedCornerShape(radius: 8, corner: .allCorners)
                            .fill(ColorPalette.emptyBackground)
                        if !progress.isFinished {
                            CustomProgressView()
                        }
                    }
                }
        } else {
            ZStack {
                RoundedCornerShape(radius: 8, corner: .allCorners)
                    .fill(ColorPalette.emptyBackground)
            }
        }
    }
    
    var body: some View {
        HStack(alignment: .center, spacing: 8) {
            avatarImage
                .frame(width: 16, height: 16)
            Text("\(match.league.name) \(match.serie.full_name)")
                .foregroundColor(ColorPalette.textPrimary)
                .font(Fonts.smallLabel)
                .lineLimit(0)
        }
    }
}
