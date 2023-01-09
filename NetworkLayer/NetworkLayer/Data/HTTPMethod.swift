//
//  HTTPMethod.swift
//  NetworkLayer
//
//  Created by Malek TRABELSI on 06/01/2023.
//

import Foundation

enum HTTPMethod: String {
    case GET = "GET"
    case POST = "POST"
    case DELETE = "DELETE"
    case PUT = "PUT"
    case PATCH = "PATCH"

    func callAsFunction() -> String {
        rawValue
    }
}
