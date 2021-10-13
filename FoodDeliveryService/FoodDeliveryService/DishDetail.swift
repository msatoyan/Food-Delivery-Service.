//
//  DishDetail.swift
//  FoodDeliveryService
//
//  Created by Михаил Атоян on 27.01.2020.
//  Copyright © 2020 Михаил Атоян. All rights reserved.
//

import SwiftUI

struct DishDetail: View {
    @EnvironmentObject var userData : UserData
    var dish: Dish
    var body: some View {
        
        VStack {
            self.dish.image
            .clipShape(Capsule())
                .overlay(Capsule().stroke(Color.gray, lineWidth: 1))
            .shadow(radius: 10)
            
            Spacer()
            
            Button("Order This")
            {
                self.userData.addDish(item: self.dish)
            }.font(.headline)
            
            Spacer()
        }
        .navigationBarTitle(Text(self.dish.name), displayMode: .inline)
        .padding()
    }
}

struct DishDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            DishDetail(dish: dishData[0]).environmentObject(UserData())
            
        }
    }
}
