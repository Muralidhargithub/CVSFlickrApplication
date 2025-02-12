//
//  Constants.swift
//  CVSFlickrApplication
//
//  Created by Muralidhar reddy Kakanuru on 2/11/25.
//


import CoreFoundation

enum Constants {
    enum API {
        static let baseURL = "https://api.flickr.com/services/feeds/photos_public.gne"
        static let defaultParams = "?format=json&nojsoncallback=1&tags="
        static let defaultSearchQuery = "nature"
    }
    
    enum Layout {
        static let gridSpacing: CGFloat = 2
        static let minimumGridItemSize: CGFloat = 100
    }
}
enum UIStrings: String {
    case loading = "Loading..."
    case failedToLoadImage = "Failed to load image. Tap to retry."
    case titleNotAvailable = "Title not available."
    case descriptionNotAvailable = "Description not available."
    case flickrSearch = "Flickr Search"
    case searchImagesPlaceholder = "Search images..."

}


