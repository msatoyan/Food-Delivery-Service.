//
//  CommentsHost.swift
//  FoodDeliveryService
//
//  Created by Михаил Атоян on 27.01.2020.
//  Copyright © 2020 Михаил Атоян. All rights reserved.
//

import SwiftUI

struct CommentsHost: View {
    
    @EnvironmentObject var userData : UserData
    @State private var showDetails = true
    @State private var comment = ""
    var body: some View {
        NavigationView{
            VStack {
                List {
                    ForEach(userData.comments, id: \.self) { item in
                        HStack{
                            Text(self.userData.profile.username)
                            Divider()
                            Text(item)
                        }
                    }.onDelete(perform: deleteItems)
                }
                    //            .navigationBarTitle("Order")
                    .listStyle(GroupedListStyle())
                    .navigationBarItems(trailing: EditButton())
                VStack {
                    //Spacer()
                    if showDetails {
                        TextField("Enter your Comment", text: $comment)
                            .font(.body)
                        
                    }
                    Spacer()
                    Button(action: {
                        //self.showDetails.toggle()
                        self.userData.addComments(item: self.comment)
                    }) {
                        Text("+")
                            .font(.title)
                            
                    }
                    
                }.padding()
            }
        }.navigationBarTitle("Comments", displayMode: .inline)
    }
    func deleteItems(at offsets: IndexSet) {
        userData.comments.remove(atOffsets: offsets)
    }
}




struct CommentsHost_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            CommentsHost().environmentObject(UserData())
        }
    }
}
