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
    
    var didAddOffer: (_ offer: Offer) -> Void

    var body: some View {
        NavigationView {
            VStack {
                Form {
                    TextField("Name", text: $name)
                    TextField("Address", text: $address)
                    
                }
                Button("Create Offer") {
                    let offer = Offer(name: name, address: address)
                    didAddOffer(offer)
                }
                .disabled(name.isEmpty || address.isEmpty)
                .padding()
            }
            
        }
        .navigationTitle("New Offer")
    }
}
