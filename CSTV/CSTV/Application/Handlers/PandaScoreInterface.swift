//
//  PandaScoreInterface.swift
//  CSTV
//
//  Created by Rafael Nunes Bezerra Dias on 23/07/23.
//

import Foundation

public enum PandaScoreRequestType {
    case UpcomingMatches
    case RunningMatches
    case TeamDetail(id: Int)
    case Player(id: Int)
    
    internal func getRequestURL() -> URLRequest {
        var request: URLRequest
        let timeout: TimeInterval = 10.0
        
        switch self {
        case .UpcomingMatches:
            request = URLRequest(url: NSURL(string: "https://api.pandascore.co/csgo/matches/upcoming")! as URL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: timeout)
        case .RunningMatches:
            request = URLRequest(url: NSURL(string: "https://api.pandascore.co/csgo/matches/running")! as URL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: timeout)
        case .TeamDetail(let id):
            request = URLRequest(url: NSURL(string: "https://api.pandascore.co/teams/\(id)")! as URL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: timeout)
        case .Player(let id):
            request = URLRequest(url: NSURL(string: "https://api.pandascore.co/players/\(id)")! as URL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: timeout)
        }
        
        return request
    }
}

class PandaScoreInterface {
    private let headers = [
        "accept": "application/json",
        "authorization": "Bearer SzqumlFMO7nEPlNCgQ7_vjuy4xDSk58hj7PYAhGg0ggoop2epF8"
    ]
    
    public func sendRequest<DecodableObject: Codable>(type: PandaScoreRequestType) async -> DecodableObject? {
        var request: URLRequest = type.getRequestURL()
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        return await APIHandler.sendRequest(request: request)
    }
}
