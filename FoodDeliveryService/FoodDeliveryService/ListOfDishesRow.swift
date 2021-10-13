//
//  ListOfDishesRow.swift
//  FoodDeliveryService
//
//  Created by Михаил Атоян on 27.01.2020.
//  Copyright © 2020 Михаил Атоян. All rights reserved.
//

import SwiftUI

struct ListOfDishesRow: View {
    var listOfDishes: ListOfDishes
    var body: some View {
        
        HStack {
        listOfDishes.image
            .resizable()
            .frame(width: 50, height: 50)
            .cornerRadius(5)
            Text(listOfDishes.name)
                .fontWeight(.heavy)
            Spacer()

        }
    }
}

struct ListOfDishesRow_Previews: PreviewProvider {
    static var previews: some View {
        ListOfDishesRow(listOfDishes: listOfDishesData[0])
            .previewLayout(.fixed(width: 300, height: 70))
    }
}
