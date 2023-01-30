//
//  SampleAppApp.swift
//  SampleApp
//
//  Created by Malek TRABELSI on 30/01/2023.
//

import SwiftUI

@main
struct SampleAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: PostsViewModel())
        }
    }
}
