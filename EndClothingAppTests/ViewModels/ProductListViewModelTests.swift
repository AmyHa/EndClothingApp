//
//  ProductListViewModelTests.swift
//  EndClothingAppTests
//
//  Created by Amy Ha on 02/06/2022.
//

import XCTest
@testable import EndClothingApp

class ProductListViewModelTests: XCTestCase {

    var viewModel: ProductListViewModel!
    var urlSession: URLSession!
    
    override func setUpWithError() throws {
        viewModel = ProductListViewModel()
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [MockURLProtocol.self]
        urlSession = URLSession(configuration: configuration)
        viewModel.service = NetworkService(session: urlSession)
    }

    override func tearDownWithError() throws {
    }
    
//    func test_fetchProducts_shouldSetProductsArray() {
//        let mockData = [Product(id: "", name: "Test shirt", price: "£199", image: "an-image-url.com")]
//
//        do {
//            let encodedMockData = try JSONEncoder().encode(mockData)
//            MockURLProtocol.requestHandler = { request in
//                return (URLResponse(), encodedMockData)
//            }
//        } catch {
//            XCTFail("Failed to encode mock data.")
//        }
//
//        let expectation = XCTestExpectation(description: "response")
//
//        viewModel.service.fetchData(with: "") { (result: Result<Products, Error>) in
//            switch result {
//            case .success(let success):
//                self.viewModel.products = success.products
//            case .failure(let failure):
//                XCTFail("Failure")
//            }
//            expectation.fulfill()
//        }
//
//        
//        wait(for: [expectation], timeout: 3)
//
//        XCTAssertEqual(viewModel.products, mockData)
//    }
}
