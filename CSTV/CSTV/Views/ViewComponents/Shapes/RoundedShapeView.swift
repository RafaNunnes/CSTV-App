//
//  RoundedShapeView.swift
//  CSTV
//
//  Created by Rafael Nunes Bezerra Dias on 21/07/23.
//

import SwiftUI

struct RoundedShapeView: View {
    var radius: CGFloat
    var backgroundColor: Color = ColorPalette.cardBackground
    
    var body: some View {
        RoundedRectangle(cornerRadius: radius)
            .fill(backgroundColor)
    }
}

struct RoundedShapeView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            RoundedShapeView(radius: 16)
                .frame(height: 176)
                .padding(.horizontal, 24)
            RoundedShapeView(radius: 30)
                .frame(width: 60, height: 60)
                .padding(.horizontal, 24)
        }
    }
}
