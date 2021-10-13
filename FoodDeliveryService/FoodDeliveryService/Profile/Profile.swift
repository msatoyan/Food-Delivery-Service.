//
//  Profile.swift
//  FoodDeliveryService
//
//  Created by Михаил Атоян on 27.01.2020.
//  Copyright © 2020 Михаил Атоян. All rights reserved.
//

import Foundation

struct Profile {
    var username: String
    var prefersNotifications: Bool
    var creaditCard: String
    
    static let `default` = Self(username: "NoName", prefersNotifications: true, creaditCard: "None")
    
    init(username: String, prefersNotifications: Bool = true, creaditCard: String) {
        self.username = username
        self.prefersNotifications = prefersNotifications
        self.creaditCard = creaditCard
    }
    
    
}
