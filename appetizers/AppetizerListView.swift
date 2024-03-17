//
//  AppetizerListView.swift
//  appetizers
//
//  Created by Vishnu Priyan Sellam Shanmugavel on 3/16/24.
//

import SwiftUI

struct AppetizerListView: View {
    
    @StateObject var viewModel = AppetizerListViewModel()
    
    var body: some View {
        NavigationView{
            List(viewModel.appetizers, id: \.id)  { appetizer in
                AppetizerListCell(appetizer: appetizer)
            }
            .navigationTitle("🌮 Appetizers")
        }
        .onAppear{
            viewModel.getAppetizer()
        }
    }
}

#Preview {
    AppetizerListView()
}
