//
//  APIService.swift
//  student648539
//
//  Created by Guido van Dijk on 14/10/2022.
//

import Foundation

extension URLSession {
    enum FetcherError: Error {
        case invalidURL
        case missingData
    }
    
    static func fetch<T: Decodable>(from url: String) async throws -> T {
        guard let url = URL(string: url) else {
            throw FetcherError.invalidURL
        }

        let (data, _) = try await URLSession.shared.data(from: url)

        let result = try JSONDecoder().decode(T.self, from: data)
        return result
    }
}
