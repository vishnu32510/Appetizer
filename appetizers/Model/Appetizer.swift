//
//  Appetizer.swift
//  appetizers
//
//  Created by Vishnu Priyan Sellam Shanmugavel on 3/16/24.
//

import Foundation

struct Appetizer: Decodable, Identifiable{
    let id: Int
    let name: String
    let protein: Int
    let carbs: Int
    let imageURL: String
    let description: String
    let price: Double
    let calories: Int
}

struct AppetizerResponse: Decodable{
    let request: [Appetizer]
}

struct MockData{
    static let smapleAppetizer = Appetizer(id: 0001, name: "Test Appetizer", protein: 10, carbs: 9, imageURL: "https://seanallen-course-backend.herokuapp.com/images/appetizers/asian-flank-steak.jpg", description: "This is my description for appetizer. Yupiii", price: 9.9, calories: 200)
    
    static let appetizers = [smapleAppetizer, smapleAppetizer, smapleAppetizer, smapleAppetizer]
    
    static let smapleOrderOne = Appetizer(id: 0001, name: "Test Appetizer", protein: 10, carbs: 9, imageURL: "https://seanallen-course-backend.herokuapp.com/images/appetizers/asian-flank-steak.jpg", description: "This is my description for appetizer. Yupiii", price: 9.9, calories: 200)
    static let smapleOrderTwo = Appetizer(id: 0002, name: "Test Appetizer", protein: 10, carbs: 9, imageURL: "https://seanallen-course-backend.herokuapp.com/images/appetizers/asian-flank-steak.jpg", description: "This is my description for appetizer. Yupiii", price: 9.9, calories: 200)
    static let smapleOrderThree = Appetizer(id: 0003, name: "Test Appetizer", protein: 10, carbs: 9, imageURL: "https://seanallen-course-backend.herokuapp.com/images/appetizers/asian-flank-steak.jpg", description: "This is my description for appetizer. Yupiii", price: 9.9, calories: 200)
    
    static let orders = [smapleOrderOne, smapleOrderTwo, smapleOrderThree]
}
