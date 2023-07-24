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
            runningMatchesList =  getSortedValidMatches(matches: matches)
        }
        
        // Fetch upcoming matches
        if let matches: [Match] = await pandaScore.sendRequest(type: .UpcomingMatches) {
            upcomingMatchesList = getSortedValidMatches(matches: matches)
        }
        
        if showProgress {
            isSearching = false
        }
    }
    
    private func getSortedValidMatches(matches: [Match]) -> [Match] {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        return matches.filter({ match in
            match.opponents.count > 1
        }).sorted(by: { firstMatch, secondMatch in
            guard let firstMatchTime = firstMatch.begin_at, let secondMatchTime = secondMatch.begin_at else { return true
            }
            
            guard let firstDate = formatter.date(from: firstMatchTime), let secondDate = formatter.date(from: secondMatchTime) else {
                return true
            }
            
            return firstDate < secondDate
        })
    }
}
