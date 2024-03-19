//
//  OrderView.swift
//  appetizers
//
//  Created by Vishnu Priyan Sellam Shanmugavel on 3/16/24.
//

import SwiftUI

struct OrderView: View {
    @StateObject var viewModel = OrderViewModel()
    var body: some View {
        NavigationView{
            ZStack {
                VStack {
                    List{
                        ForEach(viewModel.orderItem){appetizer in
                            AppetizerListCell(appetizer: appetizer)
                        }
                        .onDelete(perform: deleteItems)
                    }
                    .listStyle(PlainListStyle())
                    Spacer()
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        APButton(title: "$10.90 - Price Order")
                    })
                    .padding(.bottom,30)
                }
                if viewModel.orderItem.isEmpty {
                    EmptyState(imageName: "empty-order", message: "There is no orders available")
                }
            }
            .navigationTitle("🛒 Order")
        }
    }
    func deleteItems(at offsets: IndexSet){
        viewModel.orderItem.remove(atOffsets: offsets)
    }
}

#Preview {
    OrderView()
}
