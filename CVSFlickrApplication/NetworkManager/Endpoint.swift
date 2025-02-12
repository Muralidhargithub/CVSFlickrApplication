//
//  Endpoint.swift
//  CVSFlickrApplication
//
//  Created by Muralidhar reddy Kakanuru on 2/11/25.
//


import Foundation

struct Endpoints {
    static let flickrBaseURL = Constants.API.baseURL
    static let flickrDefaultParams = Constants.API.defaultParams
    
    static func flickrSearch(query: String) -> String {
        return flickrBaseURL + flickrDefaultParams + query
    }
}


