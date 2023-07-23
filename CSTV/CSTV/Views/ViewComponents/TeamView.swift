//
//  TeamView.swift
//  CSTV
//
//  Created by Rafael Nunes Bezerra Dias on 21/07/23.
//

import SwiftUI

struct TeamView: View {
    var teamName: String
    @State var teamImage: Image?
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            avatarImage
                .frame(width: 60, height: 60)
            Text(teamName)
                .foregroundColor(ColorPalette.textPrimary)
                .multilineTextAlignment(.center)
                .lineLimit(3)
                .frame(maxWidth: 60)
        }
    }
    
    @ViewBuilder
    private var avatarImage: some View {
        if let teamImage {
            teamImage
        } else {
            ZStack {
                RoundedCornerShape(radius: 30, corner: .allCorners).fill(ColorPalette.emptyBackground)
            }
        }
    }
}

struct TeamView_Previews: PreviewProvider {
    static var previews: some View {
        TeamView(teamName: "Time 3", teamImage: nil)
//            .padding()
            .background(ColorPalette.cardBackground)
    }
}
