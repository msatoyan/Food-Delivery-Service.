//
//  CircleImage.swift
//  FoodDeliveryService
//
//  Created by Михаил Атоян on 27.01.2020.
//  Copyright © 2020 Михаил Атоян. All rights reserved.
//

import SwiftUI

struct CircleImage: View {
    var image: Image
    
    var body: some View {
        image
            //.clipShape(Capsule())
            //.overlay(Capsule().stroke(Color.white, lineWidth: 3))
            .cornerRadius(8)
            .shadow(radius: 10)
        
        
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image : Image("saporeItaliano"))
    }
}
