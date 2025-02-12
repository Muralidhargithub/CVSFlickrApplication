//
//  Logger.swift
//  CVSFlickrApplication
//
//  Created by Muralidhar reddy Kakanuru on 2/11/25.
//


import Foundation

enum Logger {
    static func log(error: Error,additionalInfo: String? = nil) {
        var logMessage = "Error: \(error.localizedDescription)"
        if let additionalInfo = additionalInfo {
            logMessage += " - \(additionalInfo)"
        }
        print(logMessage)
    }
}
