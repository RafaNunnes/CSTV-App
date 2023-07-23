//
//  Match.swift
//  CSTV
//
//  Created by Rafael Nunes Bezerra Dias on 22/07/23.
//

import Foundation

struct Match: Identifiable, Hashable {
    var id: UUID = UUID()
    
    var firstTeam: Team
    var secondTeam: Team
    
    var isLive: Bool
    var matchTime: String
    
    static func == (lhs: Match, rhs: Match) -> Bool {
        return lhs.id == rhs.id // TODO: Add all fields
    }
    
    public func hash(into hasher: inout Hasher) {
        return hasher.combine(id)
    }
}
