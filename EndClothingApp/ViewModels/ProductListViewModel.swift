//
//  ProductListViewModel.swift
//  EndClothingApp
//
//  Created by Amy Ha on 02/06/2022.
//
import Combine

class ProductListViewModel: ObservableObject {
    
    var service = NetworkService()
    @Published private(set) var products = [Product]()
    @Published private(set) var count = 0
    
    init() {
        fetchProducts()
    }
    
    func fetchProducts() {
        service.fetchData(with: "https://www.endclothing.com/media/catalog/example.json") { [weak self] (result: Result<Products, Error>) in
            
            switch result {
            case .success(let successValue):
                self?.products = successValue.products
                self?.count = successValue.count
                print("success! \(successValue)")
            case .failure(let failureValue):
                print("failure! \(failureValue)")
            }
        }
    }
}
