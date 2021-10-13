//
//  UserData.swift
//  FoodDeliveryService
//
//  Created by Михаил Атоян on 27.01.2020.
//  Copyright © 2020 Михаил Атоян. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

final class UserData: ObservableObject  {
    @Published var showFavoritesOnly = false
    @Published var providers = providerData
    @Published var profile = Profile.default
    @Published var dishes = [Dish]()
    @Published var comments = [String]()
    var total: Int {
        if dishes.count > 0 {
            return dishes.reduce(0) { $0 + $1.price }
        } else {
            return 0
        }
    }

    func addDish(item: Dish) {
        dishes.append(item)
    }
    func addComments(item: String) {
        comments.append(item)
    }

    func removeDish(item: Dish) {
        if let index = dishes.firstIndex(of: item) {
            dishes.remove(at: index)
        }
    }
}
