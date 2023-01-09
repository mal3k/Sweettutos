//
//  Routes.swift
//  NetworkLayer
//
//  Created by Malek TRABELSI on 08/01/2023.
//

import Foundation

enum Routes: String {
    case posts = "/posts"
    case comments = "/comments"
    case albums = "/albums"
    case photos = "/photos"

    func callAsFunction() -> String {
        rawValue
    }
}
