//
//  AppView.swift
//  FoodDeliveryService
//
//  Created by Михаил Атоян on 27.01.2020.
//  Copyright © 2020 Михаил Атоян. All rights reserved.
//

import SwiftUI

struct AppView: View {
    var body: some View {
         TabView {
                   ProviderList()
                       .tabItem {
                           Image(systemName: "list.dash")
                           Text("Providers")
                       }

                   OrderView()
                       .tabItem {
                           Image(systemName: "bag")
                           Text("Order")
                       }
               }
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView().environmentObject(UserData())
    }
}
