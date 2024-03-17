//
//  NetworkManager.swift
//  appetizers
//
//  Created by Vishnu Priyan Sellam Shanmugavel on 3/16/24.
//

import Foundation

final class Networkanager{
    static let shared = Networkanager()
    
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    private let appetizerURL = baseURL + "appetizers"
    
    
    private init() {}
    
//    func getAppetizerDetails(for id: Int,completed: @escaping ((Result<Appetizer,Error>) -> Void)){
//        guard let appetizerDetailsURL = "\(appetizerURL)/\(id)" else {
//            completed(.failure(APError.unabletoComplete))
//            return
//        }
//    }
    
    func getAppetizers(completed: @escaping ((Result<[Appetizer], Error>) -> Void)){
        guard let url = URL(string: appetizerURL) else {
            completed(.failure(APError.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let _ = error {
                completed(.failure(APError.unabletoComplete))
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else{
                completed(.failure(APError.invalidResponse))
                return
            }
            guard let data = data else{
                completed(.failure(APError.invalidData))
                return
            }
            do{
                let decoder = JSONDecoder()
                let decodeResponse = try decoder.decode(AppetizerResponse.self, from: data)
                completed(.success(decodeResponse.request))
            }catch {
                completed(.failure(APError.invalidData))
            }
        }
        task.resume()
    }
}
