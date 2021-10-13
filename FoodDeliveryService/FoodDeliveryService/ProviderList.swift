//
//  ProviderList.swift
//  FoodDeliveryService
//
//  Created by Михаил Атоян on 27.01.2020.
//  Copyright © 2020 Михаил Атоян. All rights reserved.
//

import SwiftUI

struct ProviderList: View {
    // @State var showFavoritesOnly = true
    // @EnvironmentObject private var userData: UserData
    
    @State var showingProfile = false
    
    @EnvironmentObject var userData: UserData
    
    var profileButton: some View {
        Button(action: { self.showingProfile.toggle() }) {
            Image(systemName: "person.crop.circle")
                .imageScale(.large)
                .accessibility(label: Text("User Profile"))
                .padding()
        }
    }
    var body: some View {
        NavigationView {
            
            List{
                Section {
                    Toggle(isOn: $userData.showFavoritesOnly) {
                        Text("Favorites only")
                            .fontWeight(.semibold)
                            .foregroundColor(Color.green)
                    }
                    
                }
                Section {
                    ForEach(userData.providers) { provider in
                        if !self.userData.showFavoritesOnly || provider.isFavorite {
                            NavigationLink(destination: ProviderDetail(provider: provider)){
                                ProviderRow(provider: provider)
                            }
                        }
                    }
                }
                
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle(Text("Food Delivery Service"))
            .navigationBarItems(trailing: profileButton)
            .sheet(isPresented: $showingProfile) {
                ProfileHost()
                    .environmentObject(self.userData)
            }
            
        }
    }
}


struct ProviderList_Previews: PreviewProvider {
    static var previews: some View {
        
        ProviderList().environmentObject(UserData())
    }
}

