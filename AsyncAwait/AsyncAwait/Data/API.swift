//
//  API.swift
//  AsyncAwait
//
//  Created by Malek TRABELSI on 13/01/2023.
//

import Foundation

class API {
    private let apiConfig: APIConfig
    private let apiFetcher: APIFetcher

    init(apiConfig: APIConfig, apiFetcher: APIFetcher) {
        self.apiConfig = apiConfig
        self.apiFetcher = apiFetcher
    }
}

extension API {
    func getPosts() async throws -> [Post] {
        var urlComponents: URLComponents = URLComponents()
        urlComponents.path = Routes.posts.callAsFunction()
        urlComponents.scheme = apiConfig.scheme
        urlComponents.host = apiConfig.host

        guard let safeURL = urlComponents.url else {
            throw HTTPError.invalidUrl
        }
        var request: URLRequest = URLRequest(url: safeURL)
        request.httpMethod = HTTPMethod.GET.callAsFunction()
        return try await apiFetcher.request(request: request)
    }
}
