//
//  API.swift
//  NetworkLayer
//
//  Created by Malek TRABELSI on 08/01/2023.
//

import Foundation

class API {
    private let apiConfig: APIConfig
    private let apiFetcher: HTTPClient

    init(apiConfig: APIConfig, apiFetcher: HTTPClient) {
        self.apiConfig = apiConfig
        self.apiFetcher = apiFetcher
    }
}

extension API {
    func getPosts(completion: @escaping (Result<[Post],HTTPError>) -> Void) {

        var components = URLComponents()
        components.scheme = apiConfig.scheme
        components.host = apiConfig.host
        components.path = Routes.posts.callAsFunction()

        guard let url = components.url else {
            completion(.failure(.invalidUrl))
            return
        }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = HTTPMethod.GET.callAsFunction()

        apiFetcher.request(request: urlRequest) { result in
            completion(result)
        }
    }
}
