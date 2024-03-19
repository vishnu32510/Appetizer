//
//  ContentView.swift
//  appetizers
//
//  Created by Vishnu Priyan Sellam Shanmugavel on 3/15/24.
//

import SwiftUI

struct AppetizerTabView: View {
    @EnvironmentObject var order: Order
    var body: some View {
        TabView {
            AppetizerListView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            AccountView()
                .tabItem {
                    Label("Account", systemImage: "person.crop.circle")
                }
            OrderView()
                .tabItem {
                    Label("Order", systemImage: "bag")    
                }
                .badge(order.items.count)
        }
    }
}

#Preview {
    AppetizerTabView()
}
