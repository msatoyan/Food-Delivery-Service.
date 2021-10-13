//
//  ContentView.swift
//  FoodDeliveryService
//
//  Created by Михаил Атоян on 27.01.2020.
//  Copyright © 2020 Михаил Атоян. All rights reserved.
//

import SwiftUI

struct ProviderDetail: View {
    
    @EnvironmentObject var userData: UserData
    
    @State var showingComment = false
    var provider: Provider
    
    var providerIndex: Int {
        userData.providers.firstIndex(where: { $0.id == provider.id })!
    }
    
    var body: some View {
        VStack {
            
            HStack {
                CircleImage(image: provider.image)
                    .navigationBarTitle(Text(provider.name), displayMode: .inline)
                
                Spacer()
                Button(action: {
                    self.userData.providers[self.providerIndex].isFavorite.toggle()
                }) {
                    if self.userData.providers[self.providerIndex].isFavorite {
                        Image(systemName: "star.fill")
                            .foregroundColor(Color.red)
                    } else {
                        Image(systemName: "star")
                            .foregroundColor(Color.gray)
                    }
                }
            } .padding()
            
            List{
                Section{
                    ForEach(listOfDishesData) { listOfDishes in
                        if listOfDishes.providerName == self.provider.name {
                            NavigationLink(destination: DishList(listOfDishes: listOfDishes)){
                                ListOfDishesRow(listOfDishes: listOfDishes)
                            }
                            .navigationBarTitle(Text(self.provider.name), displayMode: .inline)
                        }
                    }
                }
                Section{
                    NavigationLink(destination: CommentsHost()){
                        Text("Comments")
                            .font(.headline)
                            .fontWeight(.heavy)
                            .foregroundColor(Color.green)
                    }
                }
            }.listStyle(GroupedListStyle())
            
            VStack(alignment: .center, spacing: 3) {
                
                HStack(alignment: .top){
                    Text("phone")
                        .font(.subheadline)
                    Spacer()
                    Text(provider.phone)                         .font(.subheadline)
                    //                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    //                        Text(provider.phone)
                    //                            .font(.subheadline)
                    //                    }
                }
                HStack {
                    Text("email")
                        .font(.subheadline)
                    Spacer()
                    Text(provider.email)
                        .font(.subheadline)
                    
                }
                HStack {
                    Text("web-site")
                        .font(.subheadline)
                    Spacer()
                    Text(provider.website)
                        .font(.subheadline)
                }
            }
            .padding()
            Spacer()
        }
        
        
    }
}

struct ProviderDetail_Previews: PreviewProvider {
    static var previews: some View {
        // Group{
        let userData = UserData()
        return  NavigationView{
            ProviderDetail(provider: userData.providers[0])    
                .environmentObject(userData)
        }
    }
}

