//
//  Product.swift
//  EndClothingApp
//
//  Created by Amy Ha on 02/06/2022.
//

struct Product: Decodable {
    var id: String
    var name: String
    var price: String
    var image: String
}

struct Products {
    var products: [Product]
    var title: String
    var count: Int
}

extension Products : Decodable {
    
    private enum CodingKeys: String, CodingKey {
        case products
        case title
        case count = "product_count"
    }
}
