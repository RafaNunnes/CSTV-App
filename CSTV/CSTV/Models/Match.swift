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
    
    static func == (lhs: Match, rhs: Match) -> Bool {
        return lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        return hasher.combine(id)
    }
}
