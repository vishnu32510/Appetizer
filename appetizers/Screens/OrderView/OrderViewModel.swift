//
//  File.swift
//  appetizers
//
//  Created by Vishnu Priyan Sellam Shanmugavel on 3/19/24.
//

import SwiftUI

final class OrderViewModel: ObservableObject{
    @Published var orderItem = MockData.orders
}
