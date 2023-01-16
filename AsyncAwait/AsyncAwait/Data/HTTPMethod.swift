//
//  HTTPMethod.swift
//  AsyncAwait
//
//  Created by Malek TRABELSI on 13/01/2023.
//

import Foundation

enum HTTPMethod: String {
    case GET = "GET"
    case POST = "POST"
    case DELETE = "DELETE"
    case PATCH = "PATCH"
    case PUT = "PUT"

    func callAsFunction() -> String { rawValue }
}
