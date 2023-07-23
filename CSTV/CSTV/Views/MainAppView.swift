//
//  ContentView.swift
//  CSTV
//
//  Created by Rafael Nunes Bezerra Dias on 20/07/23.
//

import SwiftUI

struct MainAppView: View {
    @State var isSplashLoading: Bool = true
    
    var body: some View {
        if isSplashLoading {
            SplashScreen(isActive: $isSplashLoading)
        } else {
            ZStack {
                ColorPalette.appBackground.ignoresSafeArea()
                MatchesListScreen()
            }
        }
    }
}

struct MainAppView_Previews: PreviewProvider {
    static var previews: some View {
        MainAppView()
    }
}
