//
//  ImageCell.swift
//  CVSFlickrApplication
//
//  Created by Muralidhar reddy Kakanuru on 2/11/25.
//

import SwiftUI
struct ImageCell: View {
    let imageUrl: String
    var animationNamespace: Namespace.ID
    let imageID: UUID
    var body: some View {
        AsyncImage(url: URL(string: imageUrl)) { phase in
            Group {
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                        .matchedGeometryEffect(id: imageID, in: animationNamespace)
                case .failure:
                    Image(systemName: "photo")
                @unknown default:
                    EmptyView()
                }
            }
            .frame(width: 100, height: 100)
            .clipped()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(8)
        }
    }
}
