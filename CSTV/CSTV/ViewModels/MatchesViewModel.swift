//
//  MatchesViewModel.swift
//  CSTV
//
//  Created by Rafael Nunes Bezerra Dias on 22/07/23.
//

import Foundation

class MatchViewModel: ObservableObject {
    @Published public var matchesList: [Match] = []
    @Published var isSearching = false
    
    let pandaScore: PandaScoreInterface = PandaScoreInterface()
    
    public func refresh() async {
        await self.fetchMatchesList()
    }
    
    @MainActor
    public func fetchMatchesList() async {
        var resultMatchList: [Match] = []
        isSearching = true
        
        // Fetch running matches
        resultMatchList = await pandaScore.sendRequest(type: .RunningMatches)
        
        // Fetch upcoming matches
        resultMatchList.append(contentsOf: await pandaScore.sendRequest(type: .UpcomingMatches))
        
        self.matchesList = resultMatchList.filter({$0.opponents.count > 1})
        
        isSearching = false
    }
}
