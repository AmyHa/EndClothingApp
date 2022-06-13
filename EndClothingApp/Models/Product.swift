//
//  Product.swift
//  EndClothingApp
//
//  Created by Amy Ha on 02/06/2022.
//

struct Product: Codable, Equatable {
    var id: String
    var name: String
    var price: String
    var image: String
}

struct Products: Equatable {
    var products: [Product]
    var title: String
    var count: Int
}

extension Products : Codable {
    
    private enum CodingKeys: String, CodingKey {
        case products
        case title
        case count = "product_count"
    }
}
