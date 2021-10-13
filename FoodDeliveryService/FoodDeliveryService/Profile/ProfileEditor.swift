//
//  ProfileEditor.swift
//  FoodDeliveryService
//
//  Created by Михаил Атоян on 27.01.2020.
//  Copyright © 2020 Михаил Атоян. All rights reserved.
//

import SwiftUI

struct ProfileEditor: View {
    @Binding var profile: Profile
    var body: some View {
        List {
            HStack {
                Text("Username  ")
                    .fontWeight(.semibold)
                Divider()
                TextField("Username", text: $profile.username)
            }
            HStack {
                Text("Credit Card").fontWeight(.semibold)
                Divider()
                TextField("Credit Card", text: $profile.creaditCard)
                    .keyboardType(.numberPad)
            }
            Toggle(isOn: $profile.prefersNotifications) {
                Text("Enable Notifications")
            }
        }
    }
}

struct ProfileEditor_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditor(profile: .constant(.default))
    }
}
