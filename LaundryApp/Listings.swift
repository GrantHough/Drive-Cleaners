//
//  Listings.swift
//  LaundryApp
//
//  Created by Grant Hough on 1/15/22.
//

import SwiftUI

struct Listings: View {
    
    //@State var x: [LaundryHouse] = [ LaundryHouse(name: "Joan Singh", address: "6969 420 Streat WeedLansd USA"), LaundryHouse(name: "weedDealer", address: "I like doing weed at 1234 alphabet soup lane"), LaundryHouse(name: "Grant Hough", address: "14803 Granite Way"), LaundryHouse(name: "Neal Malhotra", address: "13030 La Vista Drive")]
    
    var body: some View {
        NavigationView {
            VStack {
                Text("")
                List(Manager.listings, id: \.name) { xx in
                    VStack{
                        Text(xx.name)
                        Text(xx.address)
                    }
                    
                }
                .padding()
            }
        }
    }
}

struct Listings_Previews: PreviewProvider {
    static var previews: some View {
        Listings()
    }
}
