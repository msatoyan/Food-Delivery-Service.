//
//  ProviderRow.swift
//  FoodDeliveryService
//
//  Created by Михаил Атоян on 27.01.2020.
//  Copyright © 2020 Михаил Атоян. All rights reserved.
//

import SwiftUI

struct ProviderRow: View {
    var provider: Provider
    
    var body: some View {
        HStack {
            provider.image
                .resizable()
                .frame(width: 50, height: 50)
                .cornerRadius(5)
            Text(provider.name)
            .fontWeight(.heavy)
            Spacer()
            
            if provider.isFavorite {
                Image(systemName: "star.fill")
                    .imageScale(.medium)
                    .foregroundColor(.red)
            }
        }
    }
    
    struct ProviderRow_Previews: PreviewProvider {
        static var previews: some View {
            Group {
                ProviderRow(provider: providerData[0])
                ProviderRow(provider: providerData[1])
            }
            .previewLayout(.fixed(width: 300, height: 70))
        }
    }
}
