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

//class MockURLProtocol: URLProtocol {
//    static var requestHandler: ((URLRequest) throws -> (URLResponse, Data))?
//    
//    override class func canInit(with request: URLRequest) -> Bool {
//        return true
//    }
//    
//    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
//        return request
//    }
//    
//    override func startLoading() {
//        guard let handler = MockURLProtocol.requestHandler else {
//            XCTFail("Received unexpected request with no handler set")
//            return
//        }
//        do {
//            let (response, data) = try handler(request)
//            client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
//            client?.urlProtocol(self, didLoad: data)
//            client?.urlProtocolDidFinishLoading(self)
//        } catch {
//            client?.urlProtocol(self, didFailWithError: error)
//        }
//    }
//    
//    override func stopLoading() {
//    }
//}
