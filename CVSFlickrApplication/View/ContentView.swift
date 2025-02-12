//
//  ContentView.swift
//  CVSFlickrApplication
//
//  Created by Muralidhar reddy Kakanuru on 2/11/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = FlickrViewModel(dataProvider: FlickrDataProvider())
    @Namespace private var animationNamespace
    var body: some View {
        NavigationStack {
            VStack(spacing: 10) {
                if viewModel.isLoading {
                    LoadingView()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else if let error = viewModel.errorMessage {
                    ErrorView(message: error)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else {
                    ImageGridView(images: viewModel.images, viewModel: viewModel, animationNamespace: animationNamespace)
                }
            }
            .background(Color(.systemBackground))
            .navigationTitle("Flickr Search")
            .searchable(text: $viewModel.searchText, placement: .navigationBarDrawer(displayMode: .always))
            .autocapitalization(.none)
            .disableAutocorrection(true)
        }
    }
}
