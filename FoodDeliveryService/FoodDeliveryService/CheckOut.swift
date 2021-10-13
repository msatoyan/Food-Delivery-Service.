//
//  CheckOut.swift
//  FoodDeliveryService
//
//  Created by Михаил Атоян on 27.01.2020.
//  Copyright © 2020 Михаил Атоян. All rights reserved.
//

import SwiftUI

struct CheckOut: View {
    @EnvironmentObject var userData : UserData
    static let paymentTypes = ["Cash", "Credit Card"]
    @State private var paymentType = 0
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    @State private var showingPaymentAlert = false
    
    var totalPrice: Double {
        var total = Double(userData.total)
        if addLoyaltyDetails && loyaltyNumber == "1234" {
            total -= total / 10
        }
        return total
    }
    
    var body: some View {
        Form {
            Section {
                Picker("How do you want to pay?", selection: $paymentType) {
                    ForEach(0 ..< Self.paymentTypes.count) {
                        Text(Self.paymentTypes[$0])
                    }
                }
            }
            
            if paymentType == 1 && userData.profile.creaditCard == "None" {
                Text("\(userData.profile.username), you haven't credit card")
                    .foregroundColor(Color.red)
            }
            if paymentType == 1 && userData.profile.creaditCard != "None" {
                Text("Your Credit Card: \(userData.profile.creaditCard)")
            }
            
            Toggle(isOn: $addLoyaltyDetails.animation()) {
                Text("Add loyalty card")
            }
            if addLoyaltyDetails {
                TextField("Enter your ID", text: $loyaltyNumber)
            }
            Section(header: Text("TOTAL: \(totalPrice, specifier: "%.2f")₽")
                .font(.title) )
            {
                Button("Confirm order") {
                    self.showingPaymentAlert.toggle()
                }
            }
            
        }
        .navigationBarTitle(Text("Payment"), displayMode: .inline)
        .alert(isPresented: $showingPaymentAlert) {
            Alert(title: Text("Order confirmed"), message: Text("Your total was \(totalPrice, specifier: "%.2f") ₽ – thank you!"), dismissButton: .default(Text("OK")))
            
        }
        
        
    }
}

struct CheckOut_Previews: PreviewProvider {
    static var previews: some View {
        CheckOut().environmentObject(UserData())
    }
}
