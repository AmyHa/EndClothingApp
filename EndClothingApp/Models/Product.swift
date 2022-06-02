//
//  Product.swift
//  EndClothingApp
//
//  Created by Amy Ha on 02/06/2022.
//

struct Product: Decodable {
    var id: Int
    var name: String
    var price: String
    var image: String
}

struct Products {
    var products: [Product]
}
