//
//  Alert.swift
//  appetizers
//
//  Created by Vishnu Priyan Sellam Shanmugavel on 3/17/24.
//

import SwiftUI

struct AlertItem: Identifiable{
    let id = UUID()
    let title: Text
    let message: Text
    let dimissButton: Alert.Button
}

struct AlertContext {
    static let invalidData = AlertItem(title: Text("Server Error"), message: Text("The data recevied from the server is invalid. Please contact Support"), dimissButton: .default(Text("OK")))
    static let invalidResponse = AlertItem(title: Text("Server Error"), message: Text("The response recevied  from the server is invalid. Please contact Support"), dimissButton: .default(Text("OK")))
    static let invalidURL = AlertItem(title: Text("Server Error"), message: Text("Issue connecting with server. Please contact Support"), dimissButton: .default(Text("OK")))
    static let unableComplete = AlertItem(title: Text("Server Error"), message: Text("Unable to connect to the server. Please contact Support"), dimissButton: .default(Text("OK")))
    static let valueMissing = AlertItem(title: Text("Missing Value"), message: Text("Complete all Fields"), dimissButton: .default(Text("OK")))
    static let invalidEmail = AlertItem(title: Text("Invalid Email"), message: Text("Entered Email is Invalid"), dimissButton: .default(Text("OK")))
}
