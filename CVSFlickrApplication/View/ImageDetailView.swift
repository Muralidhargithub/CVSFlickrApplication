//
//  ImageDetailView.swift
//  CVSFlickrApplication
//
//  Created by Muralidhar reddy Kakanuru on 2/11/25.
//


import SwiftUI

struct ImageDetailView: View {
    let image: FlickrImage
    @ObservedObject var viewModel: FlickrViewModel
    var animationNamespace: Namespace.ID
    
    var body: some View {
        ZStack {
            BackgroundView()
            
            ScrollView {
                VStack(spacing: 20) {
                    ImageSection(image: image)
                    Spacer()
                    MetadataSection(image: image)
                    ShareButton(image: image)
                }
            }
        }
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
    }
}


struct BackgroundView: View {
    var body: some View {
        Color(.systemGroupedBackground)
            .ignoresSafeArea()
    }
}


struct ImageSection: View {
    let image: FlickrImage
    
    var body: some View {
        AsyncImage(url: URL(string: image.imageUrl)) { phase in
            switch phase {
            case .empty:
                ProgressView()
                    .frame(height: 300)
            case .success(let img):
                img.resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: .infinity, maxHeight: 300)
                    .cornerRadius(30)
                    .shadow(radius: 5)
            case .failure:
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 300)
                    .foregroundColor(.gray)
            @unknown default:
                EmptyView()
            }
        }
        .padding(.horizontal, 20)
    }
}


struct MetadataSection: View {
    let image: FlickrImage
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            // Title
            Text(image.title ?? "Untitled")
                .font(.title)
                .bold()
                .foregroundColor(.black)
                .lineLimit(2)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
                .fixedSize(horizontal: false, vertical: true)
                .dynamicTypeSize(.xSmall ... .xxxLarge)
                .accessibilityLabel(image.title ?? "Image title not available")

            // Author Section
            HStack {
                Image(systemName: "person.fill")
                Text(cleanName(image.author ?? "Unknown"))
            }
            .font(.subheadline)
            .foregroundColor(.gray)
            .accessibilityElement(children: .combine)
            .accessibilityLabel("Author: \(image.author ?? "Unknown")")

            // Published Date
            Text("Published: \(image.formattedDate)")
                .font(.footnote)
                .foregroundColor(.secondary)

            // Image Size Extraction
            if let description = image.description, let size = extractImageSize(from: description) {
                Text("Size: \(size)")
                    .font(.body)
                    .foregroundColor(.gray)
            } else {
                Text("Size not available.")
                    .font(.body)
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading) // ✅ Align content properly
        .background(Color.white)
        .cornerRadius(30)
        .shadow(radius: 5)
        .padding(.horizontal, 20)
    }
}



struct ShareButton: View {
    let image: FlickrImage
    
    var body: some View {
        ShareLink(item: shareContent()) {
            HStack {
                Image(systemName: "square.and.arrow.up")
                Text("Share Image")
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(30)
        }
        .accessibilityLabel("Share this image")
        .accessibilityHint("Double tap to open the share menu")
        .accessibilityIdentifier("ShareButton")
        .padding(.horizontal, 20)
    }
    
    private func shareContent() -> String {
        let title = image.title ?? "Untitled"
        let size = extractImageSize(from: image.description ?? "N/A") ?? "Size not available"
        let link = image.link ?? "No URL available"
        
        return "\(title)\n\(size)\n\(link)"
    }
}


