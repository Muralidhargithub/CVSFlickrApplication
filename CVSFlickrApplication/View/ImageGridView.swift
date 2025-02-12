//
//  ImageGridView.swift
//  CVSFlickrApplication
//
//  Created by Muralidhar reddy Kakanuru on 2/11/25.
//

import SwiftUI

struct ImageGridView: View {
    let images: [FlickrImage]
    @ObservedObject var viewModel: FlickrViewModel
    var animationNamespace: Namespace.ID
    private var columns: [GridItem] {
        [GridItem(.adaptive(minimum: 100), spacing: 13)]
    }
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 13) {
                ForEach(images) { image in
                    NavigationLink(destination: ImageDetailView(image: image, viewModel: viewModel, animationNamespace: animationNamespace)) {
                        ImageCell(imageUrl: image.imageUrl, animationNamespace: animationNamespace, imageID: image.id)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .padding(.horizontal, 3)
        }
    }
}



