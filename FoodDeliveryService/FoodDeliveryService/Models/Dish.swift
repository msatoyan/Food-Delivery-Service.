//
//  Dish.swift
//  FoodDeliveryService
//
//  Created by Михаил Атоян on 27.01.2020.
//  Copyright © 2020 Михаил Атоян. All rights reserved.
//

import Foundation
import SwiftUI

struct Dish: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    fileprivate var imageName: String
    //var provider: String
    var listOfDishesName: String
    var price: Int
    var isHot: Bool

}

extension Dish {
    var image: Image {
       ImageStore.shared.image(name: imageName)
    }
}
