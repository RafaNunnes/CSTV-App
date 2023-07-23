//
//  APIHandler.swift
//  CSTV
//
//  Created by Rafael Nunes Bezerra Dias on 23/07/23.
//

import Foundation

class APIHandler {
    static public func sendRequest<DecodableObject: Codable>(request: URLRequest) async -> [DecodableObject] {
        let session = URLSession.shared
        do {
            let (data, response) = try await session.data(for: request)
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                LogHandler.shared.error("API Request invalid status code")
                return []
            }
            
            let responseData: [DecodableObject] = try JSONDecoder().decode([DecodableObject].self, from: data)
            LogHandler.shared.notice("API Request successfully \(responseData)")
            return responseData
        } catch {
            LogHandler.shared.error("API Request error")
            return []
        }
    }
}
