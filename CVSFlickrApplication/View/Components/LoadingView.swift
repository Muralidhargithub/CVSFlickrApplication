//
//  LoadingView.swift
//  CVSFlickrApplication
//
//  Created by Muralidhar reddy Kakanuru on 2/11/25.
//


import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack {
            ProgressView()
            Text("Loading...")
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}


