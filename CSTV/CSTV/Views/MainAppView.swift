//
//  ContentView.swift
//  CSTV
//
//  Created by Rafael Nunes Bezerra Dias on 20/07/23.
//

import SwiftUI

struct MainAppView: View {
    var body: some View {
        NavigationView {
            ZStack {
                MatchesListScreen()
                    .navigationTitle("Partidas")
                    .navigationBarTitleDisplayMode(.large)
            }
        }
    }
}

struct MainAppView_Previews: PreviewProvider {
    static var previews: some View {
        MainAppView()
    }
}
