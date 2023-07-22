//
//  MatchesViewModel.swift
//  CSTV
//
//  Created by Rafael Nunes Bezerra Dias on 22/07/23.
//

import Foundation

class MatchViewModel: ObservableObject {
    @Published public var matchesList: [Match] = []
    
    init() {
        // Mocked list
        matchesList = [
            Match(firstTeam: Team(players: [
                Player(name: "Rafael", nickName: "bzradias", photoPath: ""),
                Player(name: "João", nickName: "Jon", photoPath: "")
            ], imagePath: ""), secondTeam: Team(players: [
                Player(name: "Pedro", nickName: "Peter", photoPath: ""),
                Player(name: "Mateus", nickName: "Matt", photoPath: ""),
                Player(name: "Lucas", nickName: "Lukas", photoPath: "")
            ], imagePath: ""), isLive: true, matchTime: "Hoje, 21:00"),
            
            Match(firstTeam: Team(players: [
                Player(name: "Rafael", nickName: "bzradias", photoPath: ""),
                Player(name: "João", nickName: "Jon", photoPath: "")
            ], imagePath: ""), secondTeam: Team(players: [
                Player(name: "Pedro", nickName: "Peter", photoPath: ""),
                Player(name: "Mateus", nickName: "Matt", photoPath: ""),
                Player(name: "Lucas", nickName: "Lukas", photoPath: "")
            ], imagePath: ""), isLive: false, matchTime: "Hoje, 21:00"),
            
            Match(firstTeam: Team(players: [
                Player(name: "Rafael", nickName: "bzradias", photoPath: ""),
                Player(name: "João", nickName: "Jon", photoPath: "")
            ], imagePath: ""), secondTeam: Team(players: [
                Player(name: "Pedro", nickName: "Peter", photoPath: ""),
                Player(name: "Mateus", nickName: "Matt", photoPath: ""),
                Player(name: "Lucas", nickName: "Lukas", photoPath: "")
            ], imagePath: ""), isLive: true, matchTime: "Hoje, 21:00"),
            
            Match(firstTeam: Team(players: [
                Player(name: "Rafael", nickName: "bzradias", photoPath: ""),
                Player(name: "João", nickName: "Jon", photoPath: "")
            ], imagePath: ""), secondTeam: Team(players: [
                Player(name: "Pedro", nickName: "Peter", photoPath: ""),
                Player(name: "Mateus", nickName: "Matt", photoPath: ""),
                Player(name: "Lucas", nickName: "Lukas", photoPath: "")
            ], imagePath: ""), isLive: false, matchTime: "Hoje, 21:00"),
            
            Match(firstTeam: Team(players: [
                Player(name: "Rafael", nickName: "bzradias", photoPath: ""),
                Player(name: "João", nickName: "Jon", photoPath: "")
            ], imagePath: ""), secondTeam: Team(players: [
                Player(name: "Pedro", nickName: "Peter", photoPath: ""),
                Player(name: "Mateus", nickName: "Matt", photoPath: ""),
                Player(name: "Lucas", nickName: "Lukas", photoPath: "")
            ], imagePath: ""), isLive: true, matchTime: "Hoje, 21:00")
        ]
    }
}
