//
//  NetworkService.swift
//  EndClothingApp
//
//  Created by Amy Ha on 02/06/2022.
//

import Foundation

class NetworkService {
    
    private let session: URLSessionProtocol
    
    init(session: URLSessionProtocol = URLSession.shared) {
        self.session = session
    }
    
    func fetchData<T:Decodable>(with urlString: String, completion: @escaping (Result<T,Error>) -> Void) {
        
        guard let url = URL(string: urlString) else { return }
        session.dataTask(with: url) { data, _, error in
            
            if let error = error {
                print("Error fetching data: \(error)")
            }
            if let data = data {
                completion(Result{ try JSONDecoder().decode(T.self, from: data)})
            }
        }.resume()
    }
}

typealias DataTaskResult = (Data?, URLResponse?, Error?) -> Void

protocol URLSessionProtocol {
    func dataTask(with url: URL, completionHandler: @escaping DataTaskResult) -> URLSessionDataTask
}

extension URLSession: URLSessionProtocol {}
