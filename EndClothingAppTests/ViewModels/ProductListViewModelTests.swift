//
//  ProductListViewModelTests.swift
//  EndClothingAppTests
//
//  Created by Amy Ha on 02/06/2022.
//

import XCTest
@testable import EndClothingApp

class ProductListViewModelTests: XCTestCase {

    var viewModel: ProductListViewModel?
    var urlSession: URLSession?
    
    override func setUpWithError() throws {
        viewModel = ProductListViewModel()
    }

    override func tearDownWithError() throws {
    }
}
