//
//  ContentView.swift
//  SampleApp
//
//  Created by Malek TRABELSI on 30/01/2023.
//

import SwiftUI

struct ContentView: View {

    private let viewModel: PostsViewModel

    @State private var postsList: [Post] = []

    init(viewModel: PostsViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        List(postsList, id: \.title) { post in
            VStack {
                Text(post.title).font(.title)
                Text(post.body)
            }
        }.onAppear{ getPosts() }
    }

    private func getPosts() {
        self.viewModel.getPosts { result in
            switch result {
            case .success(let posts): self.postsList = posts
            case .failure(let error): print(error)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: PostsViewModel())
    }
}
