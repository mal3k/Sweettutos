//
//  ContentView.swift
//  SampleApp
//
//  Created by Malek TRABELSI on 22/01/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {

        GeometryReader { geometry in
            let width = geometry.size.width
            ZStack {
                ScrollView(.horizontal) {
                    HStack(spacing: 0) {
                        Slide(name: "Slide1", width: width)
                        Slide(name: "Slide2", width: width)
                        Slide(name: "Slide3", width: width)
                        Slide(name: "Slide4", width: width)
                    }
                }
                .ignoresSafeArea()
                .onAppear {
                    UIScrollView.appearance().isPagingEnabled = true
                }
                VStack {
                    Spacer()
                    Button("Let's Start!", action: onClickAction)
                        .frame(width: 300.0, height: 70.0)
                        .background(Color.blue)
                        .cornerRadius(25)
                        .foregroundColor(.white)
                        .font(.custom("Verdana", size: 17.0).bold())
                        .padding(.bottom, 50.0)
                }
            }
        }
    }
    private func onClickAction() {
        // Move to home screen
    }
}

private struct Slide: View {
    private let name: String
    private let width: CGFloat
    init(name: String, width: CGFloat) {
        self.name = name
        self.width = width
    }
    var body: some View {
        Image(name)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: width)
            .clipped()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
