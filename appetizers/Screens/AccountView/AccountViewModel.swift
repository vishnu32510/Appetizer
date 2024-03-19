//
//  AccountViewModel.swift
//  appetizers
//
//  Created by Vishnu Priyan Sellam Shanmugavel on 3/18/24.
//

import SwiftUI

final class AccountViewModel: ObservableObject{
    
    @AppStorage("user") private var userData: Data?
    
    @Published var user = User()
    @Published var alertItem: AlertItem?
    
    var isValidForm: Bool{
        guard !user.firstName.isEmpty && !user.lastName.isEmpty && !user.email.isEmpty else {
            alertItem = AlertContext.valueMissing
            return false
        }
        guard user.email.isValidEmail else {
            alertItem = AlertContext.invalidEmail
            return false
        }
        return true
    }
    
    func saveChanges(){
        guard isValidForm else {return}
        do{
            let data = try JSONEncoder().encode(user)
            userData = data
            alertItem = AlertContext.userSaveSuccess
        }catch {
            alertItem = AlertContext.userDataFailure
        }
    }
    
    func retriveUser(){
        guard let userData = userData else {return}
        do{
            user = try JSONDecoder().decode(User.self, from: userData)
        }catch{
            alertItem = AlertContext.userDataFailure
        }
    }
}
