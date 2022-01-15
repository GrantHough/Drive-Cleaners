//
//  CreateListing.swift
//  LaundryApp
//
//  Created by Grant Hough on 1/15/22.
//

import SwiftUI


struct CreateListing: View {
    @State var selectedAddress: String = ""
    @State var selectedSoap: String = ""
    @State private var willFoldClothes = false
    @State var willDryClothes  = false
    @State var typeOfLoad: String = ""
    
    
    var body: some View {
        ZStack{
            VStack {
                Text("New Laundry Home")
                Form {
                    TextField("Address", text: $selectedAddress)
                
                    Section(header: Text("Clothes Profile")) {
                        Menu("Soap") {
                            Button("Tide", action: {
                                selectedSoap = "Tide"
                            })
                            Button("Arm and Hammer", action: {
                                selectedSoap = "Arm and Hammer"
                            })
                            Button("Purex", action: {
                                selectedSoap = "Purex"
                            })
                            Button("Enviornemently Friendly Soap", action: {
                                selectedSoap = "Enviornemently Friendly Soap"
                            })
                        }
                        Toggle("Will you fold the clothes?", isOn: $willFoldClothes)
                        Toggle("Will you dry the clothes?", isOn: $willDryClothes)
                        TextField("What type of Load", text: $typeOfLoad)
                    }
                    let _ = print(Manager.listings)
                }
                
                Button("Create", action: {
                    if (!selectedAddress.isEmpty || !typeOfLoad.isEmpty || !selectedSoap.isEmpty){
                        Manager.listings.append(LaundryHouse(name: "Dog Eater", address: selectedAddress, drying: willDryClothes, folding: willFoldClothes, soapBrand: selectedSoap, typeOfLoad: typeOfLoad))
                        let _ = print("new listing \n\n")
                        let _ = print(Manager.listings)
                    }
                    else {
                        let _ = print("not filled in all neccesary fields")
                    }
                })
            }
            
        }
        
    }
}

struct CreateListing_Previews: PreviewProvider {
    static var previews: some View {
        CreateListing()
    }
}
