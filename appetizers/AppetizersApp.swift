//
//  appetizersApp.swift
//  appetizers
//
//  Created by Vishnu Priyan Sellam Shanmugavel on 3/15/24.
//

import SwiftUI

@main
struct AppetizersApp: App {
    var order = Order()
    var body: some Scene {
        WindowGroup {
            AppetizerTabView()
                .environmentObject(order)
        }
    }
}
