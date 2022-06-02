//
//  ProductTests.swift
//  EndClothingAppTests
//
//  Created by Amy Ha on 02/06/2022.
//

import XCTest
@testable import EndClothingApp

class ProductTests: XCTestCase {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    func test_init_setsID() {
        let product = Product(id: 1, name: "", price: "", image: "")
        
        XCTAssertEqual(product.id, 1)
    }
    
    func test_init_setsName() {
        let product = Product(id: 1, name: "Test Shirt", price: "", image: "")
        
        XCTAssertEqual(product.name, "Test Shirt")
    }
    
    func test_init_setsPrice() {
        let product = Product(id: 1, name: "", price: "£199", image: "")
        
        XCTAssertEqual(product.price, "£199")
    }
    
    func test_init_setsImage() {
        let product = Product(id: 1, name: "", price: "", image: "https://media.endclothing.com/media/a-shirt.jpg")
        
        XCTAssertEqual(product.image, "https://media.endclothing.com/media/a-shirt.jpg")
    }
    
    func test_decodeObject_successfulDecodeOneProduct() throws {
        
        let decoder = JSONDecoder()
        
        let product = try decoder.decode(Product.self, from: XCTUnwrap(mockData))
        
        XCTAssertEqual(product.id, 1)
        XCTAssertEqual(product.name, "Test Shirt")
        XCTAssertEqual(product.price, "£199")
        XCTAssertEqual(product.image, "https://media.endclothing.com/media/a-shirt.jpg")
    }
}

extension ProductTests {
    
    var mockData: Data? {
        """
        {
            "id": 1,
            "name": "Test Shirt",
            "price": "£199",
            "image": "https://media.endclothing.com/media/a-shirt.jpg"
        }
        """.data(using: .utf8)
    }
}
