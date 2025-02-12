//
//  FlickrViewModel.swift
//  CVSFlickrApplication
//
//  Created by Muralidhar reddy Kakanuru on 2/11/25.
//
//

import Combine
import SwiftUI

@MainActor
class FlickrViewModel: ObservableObject {
    @Published var images: [FlickrImage] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    @Published var searchText: String = ""
    
    private let dataProvider: FlickrDataProviding
    private var cancellables = Set<AnyCancellable>()
    init(dataProvider: FlickrDataProviding = FlickrDataProvider()) {
        self.dataProvider = dataProvider
        setupSearchBinding()
        
        Task {
            await loadDefaultImages()
        }
    }
}

//MARK: - Search

extension FlickrViewModel {
    func search(for query: String) async {
        guard !query.isEmpty else {
            await loadDefaultImages()
            return
        }
        
        isLoading = true
        defer { isLoading = false }
        
        let tags = query.split(separator: ",").map { $0.trimmingCharacters(in: .whitespaces) }
        
        if tags.count > 1 {
            await searchForMultipleTags(tags)
        } else {
            await searchForSingleTag(query)
        }
    }
    
    private func searchForSingleTag(_ tag: String) async {
        do {
            let response = try await dataProvider.fetchImages(for: tag)
            self.images = response
            self.errorMessage = nil
        } catch {
            self.errorMessage = error.localizedDescription
            self.images = []
        }
    }
    
    private func searchForMultipleTags(_ tags: [String]) async {
        var allImages = Set<FlickrImage>()
        var errors: [String] = []

        await withTaskGroup(of: Result<[FlickrImage], Error>.self) { group in
            for tag in tags {
                group.addTask {
                    do {
                        let images = try await self.dataProvider.fetchImages(for: tag)
                        return .success(images)
                    } catch {
                        return .failure(error)
                    }
                }
            }

            for await result in group {
                switch result {
                case .success(let images):
                    allImages.formUnion(images)
                case .failure(let error):
                    errors.append(error.localizedDescription)
                }
            }
        }

        await MainActor.run {
            self.images = Array(allImages)
            self.errorMessage = errors.isEmpty ? nil : errors.joined(separator: "\n")
        }
    }


        private func loadDefaultImages() async {
            await search(for: "Nature")
        }
    }

//MARK: - SearchBinding

extension FlickrViewModel {
    private func setupSearchBinding() {
        $searchText
            .debounce(for: .milliseconds(300), scheduler: RunLoop.main)
            .removeDuplicates()
            .sink { [weak self] newValue in
                print("Search text changed: \(newValue)") 
                Task {
                    await self?.search(for: newValue)
                }
            }
            .store(in: &cancellables) 
    }
}
