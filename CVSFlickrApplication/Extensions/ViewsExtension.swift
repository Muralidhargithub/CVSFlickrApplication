//
//  File.swift
//  CVSFlickrApplication
//
//  Created by Muralidhar reddy Kakanuru on 2/11/25.
//


import SwiftUI

extension View {
    func errorAlert(_ error: Binding<String?>) -> some View {
        alert("Error", isPresented: .constant(error.wrappedValue != nil)) {
            Button("OK") {
                error.wrappedValue = nil
            }
        } message: {
            Text(error.wrappedValue ?? "")
        }
    }
}