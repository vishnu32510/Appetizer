//
//  User.swift
//  appetizers
//
//  Created by Vishnu Priyan Sellam Shanmugavel on 3/19/24.
//

import Foundation

struct User: Codable {
    var firstName = ""
    var lastName = ""
    var email = ""
    var birthdate = Date()
    var extraNapkins = false
    var frequentRefills = false
}
