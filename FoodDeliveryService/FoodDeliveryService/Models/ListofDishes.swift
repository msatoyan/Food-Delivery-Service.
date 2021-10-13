//
//  Dish.swift
//  FoodDeliveryService
//
//  Created by Михаил Атоян on 27.01.2020.
//  Copyright © 2020 Михаил Атоян. All rights reserved.
//

import Foundation
import SwiftUI

struct ListOfDishes: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var providerName: String
    fileprivate var imageName: String

}

extension ListOfDishes {
    var image: Image {
       ImageStore.shared.image(name: imageName)
    }
}
