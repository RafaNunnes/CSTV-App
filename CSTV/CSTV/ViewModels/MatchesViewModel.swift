//
//  MatchesViewModel.swift
//  CSTV
//
//  Created by Rafael Nunes Bezerra Dias on 22/07/23.
//

import Foundation

class MatchesViewModel: ObservableObject {
    @Published public var runningMatchesList: [Match] = []
    @Published public var upcomingMatchesList: [Match] = []
    
    @Published var isSearching = false
    
    private let pandaScore: PandaScoreInterface = PandaScoreInterface()
    
    public func refresh() async {
        await self.fetchMatchesList()
    }
    
    @MainActor
    public func fetchMatchesList() async {
        isSearching = true
        
        // Fetch running matches
        runningMatchesList = await getValidMatches(matches: pandaScore.sendRequest(type: .RunningMatches))
        
        // Fetch upcoming matches
        upcomingMatchesList = await getValidMatches(matches: pandaScore.sendRequest(type: .UpcomingMatches))
        
        isSearching = false
    }
    
    private func getValidMatches(matches: [Match]) -> [Match] {
        return matches.filter({ match in
            match.opponents.count > 1
        }).sorted(by: { firstMatch, secondMatch in
            firstMatch.begin_at < secondMatch.begin_at
        })
    }
}
