//
//  SplashScreenView.swift
//  CSTV
//
//  Created by Rafael Nunes Bezerra Dias on 20/07/23.
//

import SwiftUI

struct SplashScreen: View {
    @Binding var isActive: Bool
    @State private var iconBlur: CGFloat = 7
    @State private var iconScaleSize: CGFloat = 0.8
    
    var body: some View {
        ZStack {
            ColorPalette.appBackground.ignoresSafeArea()
            
            Image("FuzeSplashIcon")
                .frame(width: 113, height: 113, alignment: .center)
                .blur(radius: iconBlur)
                .scaleEffect(iconScaleSize)
        }
        .statusBarHidden(true)
        .onAppear {
            withAnimation(.easeOut(duration: 1.5)) {
                self.iconBlur = 0
                self.iconScaleSize = 1
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation(.easeOut(duration: 1)) {
                    isActive = false
                }
            }
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen(isActive: .constant(false))
    }
}
