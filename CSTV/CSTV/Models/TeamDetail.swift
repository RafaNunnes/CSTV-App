//
//  TeamDetail.swift
//  CSTV
//
//  Created by Rafael Nunes Bezerra Dias on 24/07/23.
//

import Foundation

struct TeamDetail: Codable {
    let id: Int
    let players: [Player]?
}
