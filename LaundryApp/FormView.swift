//
//  FormView.swift
//  LaundryApp
//
//  Created by Grant Hough on 1/15/22.
//

import Foundation
import SwiftUI

struct FormView: View {
    
    @State private var name: String = ""
    @State private var address: String = ""
    @State private var selectedSoap: String = ""
    @State private var willFoldClothes: Bool = false
    @State private var willDryClothes: Bool = false
    @State private var typeOfLoad: String = ""
    @State private var deliver: Bool = false
    @State private var estimateTime: Int = 0
    @State private var email: String = ""
    
    var didAddOffer: (_ offer: Offer) -> Void
    
    var body: some View {
        NavigationView {
            VStack {
                
                Form {
                    TextField("Address", text: $address)
                    
                    Section(header: Text("Clothes Profile")) {
                        HStack {
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
                            Text(selectedSoap)
                        }
                        Toggle("Will you fold the clothes?", isOn: $willFoldClothes)
                        Toggle("Will you dry the clothes?", isOn: $willDryClothes)
                        Toggle("Will you deliver to the clients home?", isOn: $deliver)
                        
                        
                        Picker("Estimated Time", selection: $estimateTime, content: { // <2>
                            ForEach(1...60, id: \.self) {
                                Text("\($0)")
                            }
                        })
                        TextField("Email: ", text: $email)
                        TextField("What type of Load can you do?", text: $typeOfLoad)
                        
                    }
                    
                }
                
                Button("Create", action: {
                    let offer = Offer(name: name, address: address, folding: willFoldClothes, drying: willDryClothes, soapBrand: selectedSoap, typeOfLoad: typeOfLoad, delivery: deliver, estimatedTime: estimateTime, email: email)
                    
                    didAddOffer(offer)
                })
            }.navigationTitle("New Offer")
            
            //            VStack {
            //                Form {
            //                    TextField("Name", text: $name)
            //                    TextField("Adidddress", text: $address)
            //
            //                }
            //                Button("Create Offer") {
            //                    let offer = Offer(name: name, address: address)
            //                    didAddOffer(offer)
            //                }
            //                .disabled(name.isEmpty || address.isEmpty)
            //                .padding()
            //            }
            //
            //        }
            //        .navigationTitle("New Offer")
        }
    }
}
