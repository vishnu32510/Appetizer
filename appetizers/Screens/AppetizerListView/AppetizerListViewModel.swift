//
//  AppetizerListViewModel.swift
//  appetizers
//
//  Created by Vishnu Priyan Sellam Shanmugavel on 3/17/24.
//

import Foundation

final class AppetizerListViewModel: ObservableObject{
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    @Published var isShowingDetail = false
    @Published var selectedAppetizer: Appetizer?
    
    func getAppetizer(){
        isLoading = true
        Networkanager.shared.getAppetizers { result in
            DispatchQueue.main.async {
                self.isLoading = false
                switch result{
                case .success(let appetizers):
                    self.appetizers = appetizers
                    break
                    
                case .failure(let error):
                    switch error{
                    case APError.invalidResponse:
                        self.alertItem = AlertContext.invalidResponse
                    case APError.invalidURL:
                        self.alertItem = AlertContext.invalidURL
                    case APError.invalidData:
                        self.alertItem = AlertContext.invalidData
                    case APError.unabletoComplete:
                        self.alertItem = AlertContext.unableComplete
                    default:
                        self.alertItem = AlertContext.unableComplete
                    }
                }
            }
            
        }
    }
}
