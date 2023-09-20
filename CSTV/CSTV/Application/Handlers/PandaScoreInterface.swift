//
//  PandaScoreInterface.swift
//  CSTV
//
//  Created by Rafael Nunes Bezerra Dias on 23/07/23.
//

import Foundation
import FirebaseRemoteConfig

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
    private var headers = [
        "accept": "application/json"
    ]
    
    static let shared: PandaScoreInterface = PandaScoreInterface()
    
    private init() { }
    
    public func sendRequest<DecodableObject: Codable>(type: PandaScoreRequestType, retryRequests: Int = 5) async -> DecodableObject? {
        guard retryRequests > 0 else { return nil }
        
        var request: URLRequest = type.getRequestURL()
        request.httpMethod = "GET"
        
        if hasAuthorization() {
            request.allHTTPHeaderFields = self.headers
        } else {
            await startFetchingRemoteConfigs()
            return await sendRequest(type: type, retryRequests: retryRequests - 1)
        }

        return await APIHandler.sendRequest(request: request)
    }
    
    private func hasAuthorization() -> Bool {
        return self.headers["authorization"] != nil
    }
    
    private func startFetchingRemoteConfigs() async {
        let rc = RemoteConfig.remoteConfig()
        let settings = RemoteConfigSettings()
        settings.minimumFetchInterval = 0
        rc.configSettings = settings
        
        do {
            let config = try await rc.fetchAndActivate()
            switch config {
            case .successFetchedFromRemote, .successUsingPreFetchedData:
                let token: String = rc.configValue(forKey: "authorizationToken").stringValue ?? ""
                headers["authorization"] = "Bearer \(token)"
                LogHandler.shared.info("Remote config token: \(token)")
                break
            default:
                LogHandler.shared.error("Error activating")
                break
            }
        } catch let error {
            LogHandler.shared.error("Error fetching: \(error.localizedDescription)")
        }
    }
}
