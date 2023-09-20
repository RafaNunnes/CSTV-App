//
//  CSTVApp.swift
//  CSTV
//
//  Created by Rafael Nunes Bezerra Dias on 20/07/23.
//

import SwiftUI
import Firebase

@main
struct CSTVApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
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

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}
