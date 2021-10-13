//
//  Provider.swift
//  FoodDeliveryService
//
//  Created by Михаил Атоян on 27.01.2020.
//  Copyright © 2020 Михаил Атоян. All rights reserved.
//

import SwiftUI
import CoreLocation

struct Provider: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    fileprivate var imageName: String
    var phone: String
    var email: String
    var website: String
//    var rating: Float
    var isFavorite: Bool
//    var category: Category
//
//
//    enum Category: String, CaseIterable, Codable, Hashable {
//        case featured = "Featured"
//        case lakes = "Lakes"
//        case rivers = "Rivers"
//    }
}

extension Provider {
    var image: Image {
       ImageStore.shared.image(name: imageName)
    }
}
