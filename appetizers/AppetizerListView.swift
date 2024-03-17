//
//  AppetizerListView.swift
//  appetizers
//
//  Created by Vishnu Priyan Sellam Shanmugavel on 3/16/24.
//

import SwiftUI

struct AppetizerListView: View {
    @State private var appetizers: [Appetizer] = []
    var body: some View {
        NavigationView{
            List(self.appetizers, id: \.id)  { appetizer in
                AppetizerListCell(appetizer: appetizer)
            }
            .navigationTitle("🌮 Appetizers")
        }
        .onAppear{
            getAppetizer()
        }
    }
    func getAppetizer(){
        Networkanager.shared.getAppetizers {result in
            DispatchQueue.main.async {
                switch result{
                case .success(let appetizers):
                    self.appetizers = appetizers
                    break
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
            
        }
    }
}

#Preview {
    AppetizerListView()
}
