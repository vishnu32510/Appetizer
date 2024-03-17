//
//  NetworkManager.swift
//  appetizers
//
//  Created by Vishnu Priyan Sellam Shanmugavel on 3/16/24.
//

import Foundation
import SwiftUI

final class Networkanager{
    static let shared = Networkanager()
    private let cache = NSCache<NSString, UIImage>()
    
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
    
    func downloadImage(fromURLString urlString: String, completed: @escaping (UIImage?) -> Void){
        let cacheKey = NSString(string: urlString)
        if let image = cache.object(forKey: cacheKey){
            completed(image)
        }
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)){data, response, error in
            guard let data = data, let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
        }
        task.resume()
    }
}
