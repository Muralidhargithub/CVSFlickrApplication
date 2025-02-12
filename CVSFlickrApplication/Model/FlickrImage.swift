//
//  FlickrImage.swift
//  CVSFlickrApplication
//
//  Created by Muralidhar reddy Kakanuru on 2/11/25.
//

import Foundation
// MARK: - Model

struct FlickrImage: Codable, Identifiable, Hashable, Sendable {
    let id = UUID()
    let title: String?
    let link: String?
    let media: [String: String]?
    let dateTaken: String?
    let description: String?
    let published: String?
    let author: String?
    
    enum CodingKeys: String, CodingKey {
        case title, link, media, description, published, author
        case dateTaken = "date_taken"
    }
    
    var imageUrl: String {
        media?["m"] ?? ""
    }
    
    var formattedDate: String {
        Date.formatted(from: published, inputFormat: "yyyy-MM-dd'T'HH:mm:ssZ", outputStyle: .medium) ?? published!
    }
}

struct FlickrResponse: Codable {
    let items: [FlickrImage]
}




