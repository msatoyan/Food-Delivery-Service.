//
//  OrderView.swift
//  FoodDeliveryService
//
//  Created by Михаил Атоян on 27.01.2020.
//  Copyright © 2020 Михаил Атоян. All rights reserved.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var userData : UserData
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(userData.dishes) { item in
                        DishRow(dish: item)
                    }.onDelete(perform: deleteItems)
                }

                Section {
                    NavigationLink(destination: CheckOut()) {
                        Text("Place Order")
                    }.disabled(userData.dishes.isEmpty)
                }
            }
            .navigationBarTitle("Order")
            .listStyle(GroupedListStyle())
            .navigationBarItems(trailing: EditButton())
        }
    }
    func deleteItems(at offsets: IndexSet) {
        userData.dishes.remove(atOffsets: offsets)
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView().environmentObject(UserData())
    }
}
