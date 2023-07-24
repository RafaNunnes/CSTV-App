//
//  Player.swift
//  CSTV
//
//  Created by Rafael Nunes Bezerra Dias on 21/07/23.
//

import Foundation

struct Player: Codable {
    let first_name: String?
    let image_url: String?
    let last_name: String?
    let name: String
    let id: Int
    let slug: String?
}
