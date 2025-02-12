//
//  FlickrDataProviding.swift
//  CVSFlickrApplication
//
//  Created by Muralidhar reddy Kakanuru on 2/11/25.
//

import Foundation

protocol FlickrDataProviding {
    func fetchImages(for query: String) async throws -> [FlickrImage]
}

final class FlickrDataProvider: FlickrDataProviding {
    private let networkManager: NetworkManaging

    init(networkManager: NetworkManaging = NetworkManager()) {
        self.networkManager = networkManager
    }

    func fetchImages(for query: String) async throws -> [FlickrImage] {
        guard let url = URL(string: Endpoints.flickrSearch(query: query)) else {
            throw NetworkError.invalidURL
        }

        do {
            let response: FlickrResponse = try await networkManager.fetch(endpoint: url)
            return response.items
        } catch {
            print("Error fetching images: \(error.localizedDescription)")
            throw error
        }
    }
}
