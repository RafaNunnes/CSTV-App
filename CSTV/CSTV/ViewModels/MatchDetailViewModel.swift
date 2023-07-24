//
//  MatchDetailViewModel.swift
//  CSTV
//
//  Created by Rafael Nunes Bezerra Dias on 23/07/23.
//

import Foundation

class MatchDetailViewModel: ObservableObject {
    @Published var match: Match
    
    init(match: Match) {
        self.match = match
    }
    
    public func firstTeam() -> Team? {
        return match.opponents.first?.opponent
    }
    
    public func secondTeam() -> Team? {
        return match.opponents.count > 1 ? match.opponents.last?.opponent : nil
    }
    
    public func getMatchDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        if let date = formatter.date(from: match.begin_at) {
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
                default: return match.begin_at
                }
            } else {
                formatter.dateFormat = "dd.MM HH:mm"
                return formatter.string(from: date)
            }
        } else {
            return match.begin_at
        }
    }
}
