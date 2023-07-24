//
//  MatchDetailViewModel.swift
//  CSTV
//
//  Created by Rafael Nunes Bezerra Dias on 23/07/23.
//

import Foundation

class MatchDetailViewModel: ObservableObject {
    @Published var isSearching = false
    
    let match: Match
    var firstTeamPlayers: [Player] = []
    var secondTeamPlayers: [Player] = []
    
    private let pandaScore: PandaScoreInterface = PandaScoreInterface()
    
    init(match: Match) {
        self.match = match
    }
    
    @MainActor
    public func fetchPlayersList() async {
        isSearching = true
        
        // Fetch first team players
        if let firstTeamID: Int = match.opponents.first?.opponent.id {
            let teamDetail: TeamDetail? = await pandaScore.sendRequest(type: .TeamDetail(id: firstTeamID))
            firstTeamPlayers = teamDetail?.players ?? []
        }
        
        // Fetch second team players
        if match.opponents.count > 1, let secondTeamID: Int = match.opponents.last?.opponent.id {
            let teamDetail: TeamDetail? = await pandaScore.sendRequest(type: .TeamDetail(id: secondTeamID))
            secondTeamPlayers = teamDetail?.players ?? []
        }
        
        isSearching = false
    }
    
    public func firstTeam() -> Team? {
        return match.opponents.first?.opponent
    }
    
    public func secondTeam() -> Team? {
        return match.opponents.count > 1 ? match.opponents.last?.opponent : nil
    }
    
    public func getMatchDate() -> String {
        guard let matchDate = match.begin_at else {
            return "A definir"
        }
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        if let date = formatter.date(from: matchDate) {
            formatter.timeZone = TimeZone.current
            
            let calendar = Calendar.current
            let isToday = calendar.isDateInToday(date)
            let nextWeekendDate: Date = calendar.nextWeekend(startingAfter: date)?.start ?? .distantPast
            
            if isToday {
                formatter.dateFormat = "HH:mm"
                return "Hoje, \(formatter.string(from: date))"
            } else if nextWeekendDate > date, let weekDay = calendar.dateComponents([.weekday], from: date).weekday {
                formatter.dateFormat = "HH:mm"
                switch weekDay {
                case 1: return "Dom, \(formatter.string(from: date))"
                case 2: return "Seg, \(formatter.string(from: date))"
                case 3: return "Ter, \(formatter.string(from: date))"
                case 4: return "Qua, \(formatter.string(from: date))"
                case 5: return "Qui, \(formatter.string(from: date))"
                case 6: return "Sex, \(formatter.string(from: date))"
                case 7: return "Sab, \(formatter.string(from: date))"
                default: return matchDate
                }
            } else {
                formatter.dateFormat = "dd.MM HH:mm"
                return formatter.string(from: date)
            }
        } else {
            return matchDate
        }
    }
}
