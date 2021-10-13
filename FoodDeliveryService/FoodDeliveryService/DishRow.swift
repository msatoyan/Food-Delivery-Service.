//
//  DishRow.swift
//  FoodDeliveryService
//
//  Created by Михаил Атоян on 27.01.2020.
//  Copyright © 2020 Михаил Атоян. All rights reserved.
//

import SwiftUI

struct DishRow: View {
    var dish: Dish
    //static let color: [Bool: Color] = [false: .blue, true: .red ]
    //static let isHot: [Bool: String] = [false: "C", true : "H" ]
    var body: some View {
        
        HStack {
            dish.image
                .resizable()
                .frame(width: 50, height: 50)
                .cornerRadius(5)
            Text(dish.name)
                .fontWeight(.heavy)
            Spacer()
            Text("\(String(dish.price)) ₽")
                .fontWeight(.heavy)
         dish.isHot ?
            Text("H")
                .font(.callout)
                .fontWeight(.black)
                .foregroundColor(Color.white)
                .background(Color.red)
                .cornerRadius(5)
                :
            Text("C")
                .font(.callout)
                .fontWeight(.black)
                .foregroundColor(Color.white)
                .background(Color.blue)
                .cornerRadius(5)

                    
        }
        .padding(.trailing)
    }
}

struct DishRow_Previews: PreviewProvider {
    static var previews: some View {
        DishRow(dish: dishData[0])
            .previewLayout(.fixed(width: 400, height: 70))
    }
}
