//
//  MockFlickrDataProvider.swift
//  CVSFlickrApplication
//
//  Created by Muralidhar reddy Kakanuru on 2/11/25.
//

import SwiftUI

final class MockFlickrDataProvider: FlickrDataProviding {
    var shouldReturnError = false
    var mockResponse: [FlickrImage] = []

    func fetchImages(for query: String) async throws -> [FlickrImage] {
        if shouldReturnError {
            throw NetworkError.serverError("Mock Error: Failed to fetch data")
        }
        return mockResponse
    }
}
