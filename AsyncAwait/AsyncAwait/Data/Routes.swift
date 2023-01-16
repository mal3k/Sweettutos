//
//  Routes.swift
//  AsyncAwait
//
//  Created by Malek TRABELSI on 13/01/2023.
//

import Foundation

enum Routes: String {
    case posts = "/posts"

    func callAsFunction() -> String { rawValue }
}
