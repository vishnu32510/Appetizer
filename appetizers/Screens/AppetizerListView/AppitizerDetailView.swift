//
//  AppitizerDetailView.swift
//  appetizers
//
//  Created by Vishnu Priyan Sellam Shanmugavel on 3/18/24.
//

import SwiftUI

struct AppitizerDetailView: View {
    
    @EnvironmentObject var order: Order
    let appetizer: Appetizer
    @Binding var isShowingDetail: Bool
    
    var body: some View {
        VStack{
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 225)
            VStack{
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                Text(appetizer.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
                HStack(spacing: 40){
                    NutritionInfo(title: "Calories", value: appetizer.calories)
                    NutritionInfo(title: "Carbs", value: appetizer.carbs)
                    NutritionInfo(title: "Protien", value: appetizer.protein)
                }
            }
            Spacer()
            Button(action: {
                order.add(appetizer)
                isShowingDetail = false
            }, label: {
                APButton(title: "$\(appetizer.price, specifier: "%.2f") - Add to Order")
            })
            .padding(.bottom, 30)
            
        }
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(Button(action: {
            isShowingDetail = false
        }, label: {
            CloseButton()
        }).padding(),alignment: .topTrailing)
    }
}

#Preview {
    AppitizerDetailView(appetizer: MockData.smapleAppetizer,isShowingDetail: .constant(true))
}

struct NutritionInfo: View {
    let title: String
    let value: Int
    var body: some View {
        VStack(spacing: 5){
            Text(title)
                .font(.caption)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            Text("\(value)")
                .foregroundColor(.secondary)
                .fontWeight(.semibold)
                .italic()
        }
    }
}
