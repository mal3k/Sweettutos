//
//  HTTPError.swift
//  NetworkLayer
//
//  Created by Malek TRABELSI on 06/01/2023.
//

import Foundation

enum HTTPError: Error {
    case failedResponse
    case failedDecoding
    case invalidUrl
    case invalidData 
}
