//
//  PostsViewModel.swift
//  SampleApp
//
//  Created by Malek TRABELSI on 30/01/2023.
//

import Foundation

class PostsViewModel {

    lazy private var api = {
        let apiConfig = APIConfig(scheme: "https", host: "jsonplaceholder.typicode.com")
        let api = API(apiConfig: apiConfig, apiFetcher: APIFetcher())
        return api
    }()

    func getPosts(completion: @escaping (Result<[Post], HTTPError>) -> Void) {
        api.getPosts { result in
            switch result {
            case .success(let posts): completion(.success(posts))
            case .failure(let error): completion(.failure(error))
            }
        }
    }
}
