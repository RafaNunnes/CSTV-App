//
//  Match.swift
//  CSTV
//
//  Created by Rafael Nunes Bezerra Dias on 22/07/23.
//

import Foundation

struct Match: Codable, Hashable {
    let id: Int
    let begin_at: String
    let league: League
    let serie: Serie
    let opponents: [Opponent]
    
    public func firstTeam() -> Team? {
        return opponents.first?.opponent
    }
    
    public func secondTeam() -> Team? {
        return opponents.count > 1 ? opponents.last?.opponent : nil
    }
    
    func getMatchDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        if let date = formatter.date(from: begin_at) {
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
                default: return begin_at
                }
            } else {
                formatter.dateFormat = "dd.MM HH:mm"
                return formatter.string(from: date)
            }
        } else {
            return begin_at
        }
    }
    
    static func == (lhs: Match, rhs: Match) -> Bool {
        return lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        return hasher.combine(id)
    }
}
