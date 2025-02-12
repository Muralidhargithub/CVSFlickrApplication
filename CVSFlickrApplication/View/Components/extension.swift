//
//  extension.swift
//  CVSFlickrApplication
//
//  Created by Muralidhar reddy Kakanuru on 2/11/25.
//


extension FlickrImage {
    var cleanDescription: String {
        description?.strippingHTML ?? "No description available"
    }
    
    var cleanAuthor: String {
        guard let author = author else { return "Unknown author" }
        return author.components(separatedBy: "\"").last ?? author
    }
    
    var dimensions: String {
        "N/A"
    }
}

extension String {
    var strippingHTML: String {
        replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression)
    }
}
