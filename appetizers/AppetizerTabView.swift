//
//  ContentView.swift
//  appetizers
//
//  Created by Vishnu Priyan Sellam Shanmugavel on 3/15/24.
//

import SwiftUI

struct AppetizerTabView: View {
    var body: some View {
        TabView {
            AppetizerListView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            AccountView()
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Account")
                }
            OrderView()
                .tabItem {
                    Image(systemName: "bag")
                    Text("Order")
                }
        }
        .accentColor(Color(.brandPrimary))
    }
}

#Preview {
    AppetizerTabView()
}
