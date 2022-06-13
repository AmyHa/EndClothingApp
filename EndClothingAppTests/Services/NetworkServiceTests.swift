//
//  NetworkServiceTests.swift
//  EndClothingAppTests
//
//  Created by Amy Ha on 02/06/2022.
//

import XCTest
@testable import EndClothingApp

class NetworkServiceTests: XCTestCase {

    var service: NetworkService!
    let session = MockURLSession()
    
    override func setUpWithError() throws {
        self.service = NetworkService(session: session)
    }

    override func tearDownWithError() throws {
    }

    func test_fetchData_shouldRequestCorrectURL() {
        let url = "https://www.endclothing.com/media/catalog/example.json"
        service.fetchData(with: url) { (result: Result<Products, Error>) in
            
        }
        let expectedURL = URL(string: url)
        let returnedURL = session.lastURL
        
        XCTAssertEqual(expectedURL, returnedURL)
    }
}


// MARK: Mocks classes for testing

class MockURLSession: URLSessionProtocol {
    private (set) var lastURL: URL?

    func dataTask(with url: URL, completionHandler: @escaping DataTaskResult) -> URLSessionDataTask {
        lastURL = url
        return URLSession.shared.dataTask(with: url)
    }
}
