//
//  ProfileSummary.swift
//  FoodDeliveryService
//
//  Created by Михаил Атоян on 27.01.2020.
//  Copyright © 2020 Михаил Атоян. All rights reserved.
//

import SwiftUI

struct ProfileSummary: View {
    var profile: Profile
    
    var body: some View {
        List {
            Text(profile.username)
                .bold()
                .font(.title)
            
            Text("Credit card: \(profile.creaditCard)")
            .bold()
            Text("Notifications: \(self.profile.prefersNotifications ? "On": "Off" )")
            .bold()
            //.font(.title)
        }
    }
}

struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary(profile: Profile.default)
    }
}
