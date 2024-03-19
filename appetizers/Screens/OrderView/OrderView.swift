//
//  OrderView.swift
//  appetizers
//
//  Created by Vishnu Priyan Sellam Shanmugavel on 3/16/24.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order: Order
    var body: some View {
        NavigationView{
            ZStack {
                VStack {
                    List{
                        ForEach(order.items){appetizer in
                            AppetizerListCell(appetizer: appetizer)
                        }
                        .onDelete(perform: order.deleteItems)
                    }
                    .listStyle(PlainListStyle())
                    Spacer()
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        APButton(title: "$\(order.totalPrice, specifier: "%.2f") - Price Order")
                    })
                    .padding(.bottom,30)
                }
                if order.items.isEmpty {
                    EmptyState(imageName: "empty-order", message: "There is no orders available")
                }
            }
            .navigationTitle("🛒 Order")
        }
    }
 
}

#Preview {
    OrderView()
}
