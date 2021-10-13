//
//  DishDetail.swift
//  FoodDeliveryService
//
//  Created by Михаил Атоян on 27.01.2020.
//  Copyright © 2020 Михаил Атоян. All rights reserved.
//

import SwiftUI

struct DishList: View {
    var listOfDishes: ListOfDishes
    //var dish: Dish
    var body: some View {
        VStack {
           //NavigationView {
                List{
                    ForEach(dishData) { dish in
                        if dish.listOfDishesName == self.listOfDishes.name {
                            NavigationLink(destination: DishDetail(dish: dish)){
                                DishRow(dish: dish)
                            }
                            .navigationBarTitle(Text(self.listOfDishes.name), displayMode: .inline)
                        }
                    }
                }
            //}
        }
    }
}

struct DishList_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            DishList(listOfDishes: listOfDishesData[2])
            DishList(listOfDishes: listOfDishesData[1])
        }
    }
}
