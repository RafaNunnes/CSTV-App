//
//  ContentView.swift
//  CSTV
//
//  Created by Rafael Nunes Bezerra Dias on 20/07/23.
//

import SwiftUI

struct MainAppView: View {
    init() {
        Theme.navigationBarColors(background: ColorPalette.appBackground.toUIColor(), titleColor: ColorPalette.textPrimary.toUIColor())
    }
    
    var body: some View {
        ZStack {
            ColorPalette.appBackground.ignoresSafeArea()
            MatchesListScreen()
        }
    }
}

struct MainAppView_Previews: PreviewProvider {
    static var previews: some View {
        MainAppView()
    }
}
