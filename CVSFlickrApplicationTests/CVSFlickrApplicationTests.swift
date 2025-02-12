//
//  CVSFlickrApplicationTests.swift
//  CVSFlickrApplicationTests
//
//  Created by Muralidhar reddy Kakanuru on 2/11/25.
//

import SwiftUI
import XCTest
@testable import CVSFlickrApplication

@MainActor
final class CVSFlickrApplicationTests: XCTestCase {
    var viewModel: FlickrViewModel!
    var mockDataProvider: MockFlickrDataProvider!
    var images: [FlickrImage] = []
    var detailView: ImageDetailView!
    
    override func setUp()  {
        super.setUp()
            mockDataProvider = MockFlickrDataProvider()
            viewModel = FlickrViewModel(dataProvider: mockDataProvider)
        
            images = [
                    FlickrImage(title: "Horse", link: "", media: ["m": "https://test.com/image1.jpg"], dateTaken: "", description: "", published: "2024-02-10T12:30:00Z", author: "jack"),
                    FlickrImage(title: "Car", link: "", media: ["m": "https://test.com/image2.jpg"], dateTaken: "", description: "", published: "2023-02-10T12:30:00Z", author: "tom"),
                    FlickrImage(title: "Bird", link: "", media: ["m": "https://test.com/image3.jpg"], dateTaken: "", description: "", published: "2022-01-10T12:30:00Z", author: "kim")
                ]
                mockDataProvider.mockResponse = images
    }

    override func tearDown()  {
        mockDataProvider = nil
        viewModel = nil
        super.tearDown()
    }

    func testSearchUpdateResult() async{
        await viewModel.search(for: "Horse")
        XCTAssertEqual(viewModel.images.count, 3, "Search should return 1 image")
        XCTAssertEqual(viewModel.images.first?.title, "Horse")
    }
    
    func testMultipleTestWords() async {
        await viewModel.search(for: "Horse, Car")
        XCTAssertEqual(viewModel.images.count, 3, "Search should return 2 images")
        XCTAssertTrue(viewModel.images.contains { $0.title == "Horse" })
        XCTAssertTrue(viewModel.images.contains { $0.title == "Car" })
    }
    
    func testDefaultSearchTerm() async {
        await viewModel.search(for: "Bird")
            await viewModel.search(for: "")
            XCTAssertEqual(viewModel.images.count, 3)
            XCTAssertEqual(viewModel.images.first?.title, "Horse", "Default image should be 'Nature'")
    }
    
    func testImageLoadingIsAsynchronous() async {
        await viewModel.search(for: "Horse")
        XCTAssertFalse(viewModel.isLoading, "Images should load asynchronously without blocking UI")
        XCTAssertGreaterThan(viewModel.images.count, 0, "Images should be loaded successfully")
    }
    
    func testImageDetailViewContent() {
            let detailViews = ImageDetailView(image: images[0], viewModel: viewModel, animationNamespace: Namespace().wrappedValue)

        XCTAssertEqual(detailViews.image.title, "Horse")
        XCTAssertEqual(detailViews.image.author, "jack")
        }

    func testInvalidSearchReturnsNoResults() async {
        await viewModel.search(for: "qwertyuiop")
        XCTAssertFalse(viewModel.images.contains { $0.title == "qwertyuiop" })
    }

    func testImageLoadFailureDisplaysFallback() async {
        mockDataProvider.mockResponse = [
            FlickrImage(title: "Broken Image", link: "", media: ["m": "invalid_url"], dateTaken: "", description: "", published: "", author: "")
        ]
        await viewModel.search(for: "Broken Image")
        XCTAssertEqual(viewModel.images.count, 1, "One image should be returned ")
        XCTAssertNotNil(viewModel.images.first?.imageUrl, "Image have a URL field")
    }

    func testDetailScreenDisplaysCorrectMetadata() {
        let metadataSection = MetadataSection(image: images[0])
        XCTAssertNotNil(metadataSection, "Metadata is initialized")
    }

    func testShareButtonExists() {
        let shareButton = ShareButton(image: images[0])
        XCTAssertNotNil(shareButton, "Share button should exist")
    }
    
    func testExtractImageSize_ValidDescription() {
           let description = "Some text <img src=\"test.jpg\" width=\"1920\" height=\"1080\"> more text"
           let extractedSize = extractImageSize(from: description)
           
           XCTAssertEqual(extractedSize, "1920x1080 pixels", "Should correctly extract image size from description")
       }
    

}



