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
        await self.fetchMatchesList(showProgress: false)
    }
    
    @MainActor
    public func fetchMatchesList(showProgress: Bool = true) async {
        if showProgress {
            isSearching = true
        }
        
        // Fetch running matches
        if let matches: [Match] = await pandaScore.sendRequest(type: .RunningMatches) {
            runningMatchesList =  getValidMatches(matches: matches)
        }
        
        // Fetch upcoming matches
        if let matches: [Match] = await pandaScore.sendRequest(type: .UpcomingMatches) {
            upcomingMatchesList = getValidMatches(matches: matches)
        }
        
        if showProgress {
            isSearching = false
        }
    }
    
    private func getValidMatches(matches: [Match]) -> [Match] {
        return matches.filter({ match in
            match.opponents.count > 1
        }).sorted(by: { firstMatch, secondMatch in
            firstMatch.begin_at ?? "" < secondMatch.begin_at ?? ""
        })
    }
}
