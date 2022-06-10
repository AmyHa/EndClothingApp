//
//  ProductListViewModel.swift
//  EndClothingApp
//
//  Created by Amy Ha on 02/06/2022.
//

class ProductListViewModel {
    
    var products = [Product]()
    var service = NetworkService()
    
    func fetchProducts() {
        service.fetchData(with: "https://www.endclothing.com/media/catalog/example.json") { [weak self] (result: Result<Products, Error>) in
            
            switch result {
            case .success(let successValue):
                self?.products = successValue.products
                print("success! \(successValue)")
            case .failure(let failureValue):
                print("failure! \(failureValue)")
            }
        }
    }
}
