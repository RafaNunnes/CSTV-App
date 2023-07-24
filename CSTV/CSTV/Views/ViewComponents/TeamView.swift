//
//  TeamView.swift
//  CSTV
//
//  Created by Rafael Nunes Bezerra Dias on 21/07/23.
//

import SwiftUI
import Kingfisher

struct TeamView: View {
    let team: Team?
    
    @ViewBuilder
    private var avatarImage: some View {
        if let teamImage = team?.image_url {
            KFImage(URL(string: teamImage))
                .resizable()
                .placeholder { progress in
                    ZStack {
                        RoundedCornerShape(radius: 30, corner: .allCorners)
                            .fill(ColorPalette.emptyBackground)
                        if !progress.isFinished {
                            CustomProgressView()
                        }
                    }
                }
        } else {
            ZStack {
                RoundedCornerShape(radius: 30, corner: .allCorners)
                    .fill(ColorPalette.emptyBackground)
            }
        }
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            avatarImage
                .frame(width: 60, height: 60)
            Text(team?.name ?? team?.slug ?? "")
                .foregroundColor(ColorPalette.textPrimary)
                .multilineTextAlignment(.center)
                .lineLimit(3)
                .frame(maxWidth: 60)
        }
    }
}
