//
//  NetworkManager.swift
//  CVSFlickrApplication
//
//  Created by Muralidhar reddy Kakanuru on 2/11/25.
//


import Foundation

protocol NetworkManaging {
    func fetch<T: Decodable>(endpoint: URL) async throws -> T
}
// modifying

final class NetworkManager: NetworkManaging {
    static let shared = NetworkManager()
    private let session: URLSession
    
    init(){
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 30
        self.session = URLSession(configuration: config)
    }
    
    func fetch<T: Decodable>(endpoint: URL) async throws -> T {
        
        let (data, response) = try await session.data(from: endpoint)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.serverError("Invalid response")
        }
        
        guard (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.serverError("Invalid response with status code: \(httpResponse.statusCode)")
        }
        
        
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            Logger.log(error: error, additionalInfo: "Failed to decode data for URL: \(endpoint.absoluteString)")
            throw NetworkError.decodingError
        }
    }
}


