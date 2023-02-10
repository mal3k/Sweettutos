//
//  ContentView.swift
//  Sample
//
//  Created by Malek TRABELSI on 09/02/2023.
//

import SwiftUI

struct ContentView: View {
    @State var posts: [Post] = []
    var body: some View {
        List(posts, id: \.title) { post in
            DisclosureGroup {
                Text(post.body)
            } label: {
                Text(post.title).font(.title)
            }
        }
        .padding()
        .onAppear {
            let viewModel = PostsViewModel()
            self.posts = viewModel.getPosts() ?? []
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
