//
//  CSTVApp.swift
//  CSTV
//
//  Created by Rafael Nunes Bezerra Dias on 20/07/23.
//

import SwiftUI

@main
struct CSTVApp: App {
    init() {
        Theme.navigationBarColors(background: ColorPalette.appBackground.toUIColor(), titleColor: ColorPalette.textPrimary.toUIColor())
    }
    
    var body: some Scene {
        WindowGroup {
            MainAppView()
                .preferredColorScheme(ColorScheme.dark)
        }
    }
}
