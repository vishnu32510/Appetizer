//
//  CloseButton.swift
//  appetizers
//
//  Created by Vishnu Priyan Sellam Shanmugavel on 3/18/24.
//

import SwiftUI

struct CloseButton: View {
    var body: some View {
        ZStack{
            Circle()
                .frame(width: 30)
                .foregroundColor(.white)
                .opacity(0.6)
            Image(systemName: "xmark")
                .imageScale(.small)
                .frame(width: 40, height: 40)
                .foregroundColor(.black)
        }
    }
}

#Preview {
    CloseButton()
}
