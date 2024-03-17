//
//  AppetizerListViewModel.swift
//  appetizers
//
//  Created by Vishnu Priyan Sellam Shanmugavel on 3/17/24.
//

import Foundation

final class AppetizerListViewModel: ObservableObject{
    @Published var appetizers: [Appetizer] = []
    
    func getAppetizer(){
        Networkanager.shared.getAppetizers {result in
            DispatchQueue.main.async {
                switch result{
                case .success(let appetizers):
                    self.appetizers = appetizers
                    break
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
            
        }
    }
}
