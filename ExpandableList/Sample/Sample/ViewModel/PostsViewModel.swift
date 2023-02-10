//
//  PostsViewModel.swift
//  Sample
//
//  Created by Malek TRABELSI on 10/02/2023.
//

import Foundation

class PostsViewModel {
    lazy var file: URL? = {
        guard let file = Bundle.main.url(forResource: "posts", withExtension: "json") else {
            print("Couldn't find the file posts.json")
            return nil
        }
        return file
    }()

    func getPosts() -> [Post]? {
        guard let file = self.file else {
            return nil
        }

        do {
            let data = try Data(contentsOf: file)
            let posts = try JSONDecoder().decode([Post].self, from: data)
            return posts
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}
