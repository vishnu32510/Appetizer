//
//  AccountViewModel.swift
//  appetizers
//
//  Created by Vishnu Priyan Sellam Shanmugavel on 3/18/24.
//

import Foundation

final class AccountViewModel: ObservableObject{
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var email = ""
    @Published var birthdate = Date()
    @Published var extraNapkins = false
    @Published var frequentRefills = false
    @Published var alertItem: AlertItem?
    
    var isValidForm: Bool{
        guard !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty else {
            alertItem = AlertContext.valueMissing
            return false
        }
        guard email.isValidEmail else {
            alertItem = AlertContext.invalidEmail
            return false
        }
        return true
    }
    
    func saveChanges(){
        guard isValidForm else {return}
    }
}
