//
//  HTTPError.swift
//  AsyncAwait
//
//  Created by Malek TRABELSI on 13/01/2023.
//

import Foundation

enum HTTPError: Error {
    case failedResponse
    case failedDecoding
    case invalidData
    case invalidUrl
}
