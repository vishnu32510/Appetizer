//
//  APError.swift
//  appetizers
//
//  Created by Vishnu Priyan Sellam Shanmugavel on 3/16/24.
//

import Foundation

enum APError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case unabletoComplete
    case valueMissing
    case invalidEmail
}
