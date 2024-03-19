//
//  APButton.swift
//  appetizers
//
//  Created by Vishnu Priyan Sellam Shanmugavel on 3/18/24.
//

import SwiftUI

struct APButton: View {
    let title: LocalizedStringKey
    var body: some View {
        Text(title)
            .font(.title3)
            .fontWeight(.semibold)
            .frame(width: 260, height: 50)
            .foregroundColor(.white)
            .background(Color.brandPrimaryColor)
            .cornerRadius(10)
    }
}

#Preview {
    APButton(title: "Button Title")
}
