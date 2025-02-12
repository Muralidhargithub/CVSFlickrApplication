//
//  Helper.swift
//  CVSFlickrApplication
//
//  Created by Muralidhar reddy Kakanuru on 2/11/25.
//



import Foundation

func cleanName(_ title: String) -> String {
    let cleanedString = title.replacingOccurrences(of: "nobody@flickr.com (\"", with: "")
        .replacingOccurrences(of: "\")", with: "")
        .replacingOccurrences(of: "(", with: "")
        .replacingOccurrences(of: ")", with: "")
        .capitalized
    return cleanedString
}

func getAttributedString(from htmlString: String) -> AttributedString {
    guard let data = htmlString.data(using: .utf8) else {
        return AttributedString(htmlString)
    }
    
    do {
        let attributedString = try NSAttributedString(
            data: data,
            options: [.documentType: NSAttributedString.DocumentType.html],
            documentAttributes: nil
        )
        return AttributedString(attributedString.string)
    } catch {
        print("Error parsing HTML: \(error)")
        return AttributedString(htmlString)
    }
}

//retrive size from description
func extractImageSize(from description: String) -> String? {
    let pattern = #"width=\"(\d+)\" height=\"(\d+)\""#
    
    if let regex = try? NSRegularExpression(pattern: pattern, options: []) {
        let nsDescription = description as NSString
        if let match = regex.firstMatch(in: description, options: [], range: NSRange(location: 0, length: nsDescription.length)) {
            let width = nsDescription.substring(with: match.range(at: 1))
            let height = nsDescription.substring(with: match.range(at: 2))
            return "\(width)x\(height) pixels"
        }
    }
    return nil
}
