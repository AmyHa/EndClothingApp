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
        let product = Product(id: "1", name: "", price: "", image: "")
        
        XCTAssertEqual(product.id, "1")
    }
    
    func test_init_setsName() {
        let product = Product(id: "1", name: "Test Shirt", price: "", image: "")
        
        XCTAssertEqual(product.name, "Test Shirt")
    }
    
    func test_init_setsPrice() {
        let product = Product(id: "1", name: "", price: "£199", image: "")
        
        XCTAssertEqual(product.price, "£199")
    }
    
    func test_init_setsImage() {
        let product = Product(id: "1", name: "", price: "", image: "https://media.endclothing.com/media/a-shirt.jpg")
        
        XCTAssertEqual(product.image, "https://media.endclothing.com/media/a-shirt.jpg")
    }
    
    func test_decodeObject_successfulDecodeOneProduct() throws {
        
        let decoder = JSONDecoder()
        
        let product = try decoder.decode(Product.self, from: XCTUnwrap(mockProductData))
        
        XCTAssertEqual(product.id, "1")
        XCTAssertEqual(product.name, "Test Shirt")
        XCTAssertEqual(product.price, "£199")
        XCTAssertEqual(product.image, "https://media.endclothing.com/media/a-shirt.jpg")
    }
    
    func test_decodeObject_successfulDecodeProducts() throws {
        
        let decoder = JSONDecoder()
        
        let data = try decoder.decode(Products.self, from: XCTUnwrap(mockProductsData))
        
        XCTAssertEqual(data.title, "Exercise Listing")
        XCTAssertEqual(data.count, 50)
        
        XCTAssertEqual(data.products[0].id, "1")
        XCTAssertEqual(data.products[0].name, "Test Shirt")
        XCTAssertEqual(data.products[0].price, "£199")
        XCTAssertEqual(data.products[0].image, "https://media.endclothing.com/media/a-shirt.jpg")
        
        XCTAssertEqual(data.products[1].id, "1")
        XCTAssertEqual(data.products[1].name, "Test Shirt")
        XCTAssertEqual(data.products[1].price, "£199")
        XCTAssertEqual(data.products[1].image, "https://media.endclothing.com/media/a-shirt.jpg")
    }
}

extension ProductTests {
    
    var mockProductData: Data? {
        """
        {
            "id": 1,
            "name": "Test Shirt",
            "price": "£199",
            "image": "https://media.endclothing.com/media/a-shirt.jpg"
        }
        """.data(using: .utf8)
    }
    
    var mockProductsData: Data? {
        """
        {
            "products": [
                {
                  "id": 1,
                  "name": "Test Shirt",
                  "price": "£199",
                  "image": "https://media.endclothing.com/media/a-shirt.jpg"
                },
                {
                  "id": 1,
                  "name": "Test Shirt",
                  "price": "£199",
                  "image": "https://media.endclothing.com/media/a-shirt.jpg"
                }
            ],
            "title": "Exercise Listing",
            "product_count": 50
        }
        """.data(using: .utf8)
    }
}
