//
//  NetworkError.swift
//  CVSFlickrApplication
//
//  Created by Muralidhar reddy Kakanuru on 2/11/25.
//


import Foundation
enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
    case serverError(String)
}
