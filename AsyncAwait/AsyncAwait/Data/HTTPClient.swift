//
//  HTTPClient.swift
//  AsyncAwait
//
//  Created by Malek TRABELSI on 13/01/2023.
//

import Foundation

protocol HTTPClient {
    func request<T: Decodable>(request: URLRequest) async throws -> T
}

class APIFetcher: HTTPClient {
    func request<T: Decodable>(request: URLRequest) async throws -> T {
        let (data, response) = try await URLSession.shared.data(for: request)

        guard let safeResponse = response as? HTTPURLResponse, (200...299).contains(safeResponse.statusCode) else {
            throw HTTPError.failedResponse
        }

        do {
            let decodedData = try JSONDecoder().decode(T.self, from: data)
            return decodedData
        } catch let error{
            print(error.localizedDescription)
            throw HTTPError.failedDecoding
        }
    }
}
