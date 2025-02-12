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

let sampleJSON = """
{
    "items": [
        {
            "title": "Sunset View",
            "link": "https://flickr.com/photo123",
            "media": { "m": "https://flickr.com/sample.jpg" },
            "date_taken": "2024-02-10T12:30:00Z",
            "description": "A beautiful sunset.",
            "published": "2024-02-11T08:00:00Z",
            "author": "John Doe"
        }
    ]
}
""".data(using: .utf8)
