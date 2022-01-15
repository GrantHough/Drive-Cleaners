//
//  Listings.swift
//  LaundryApp
//
//  Created by Grant Hough on 1/15/22.
//

import SwiftUI

struct Listings: View {
    
    //@State var x: [LaundryHouse] = [ LaundryHouse(name: "Joan Singh", address: "6969 420 Streat WeedLansd USA"), LaundryHouse(name: "weedDealer", address: "I like doing weed at 1234 alphabet soup lane"), LaundryHouse(name: "Grant Hough", address: "14803 Granite Way"), LaundryHouse(name: "Neal Malhotra", address: "13030 La Vista Drive")]
    @ObservedObject var offerListViewModel: OfferListViewModel
    @State private var showingForm = false
    @State private var showFolding = false
    
    var body: some View {
        NavigationView {
            VStack {
                //  Text("")
                //   List(Manager.listings, id: \.name) { xx in
                //       VStack{
                //         Text(xx.name)
                //    Text(xx.address)
                //  }
                
                Toggle(isOn: $showFolding) { Text("\(showFolding ? "Hide" : "Show") folding offers") }
                List {
                    ForEach (offerListViewModel.offerViewModel.filter {
                                $0.offer.folding == showFolding }) { offerVM in
                        OfferView(offerViewModel: offerVM)
                            .onLongPressGesture(minimumDuration: 1) {
                                var offer = offerVM.offer
                                offer.folding.toggle()
                                offerListViewModel.update(offer)
                            }
                    }
                    .onDelete(perform: delete)
                    
                }
                .listStyle(InsetListStyle())
                .navigationTitle("Offers")
                
                Button(action: {
                    showingForm = true
                }) {
                    Circle()
                        .fill(Color.green)
                        .frame(height: 60)
                        .overlay(Image(systemName: "plus").foregroundColor(.white))
                }
                .sheet(isPresented: $showingForm) {
                    FormView { (offer) in
                        offerListViewModel.add(offer)
                        showingForm = false
                    }
                }
            }
            .padding()
        }
    }
    
    private func delete(at offsets: IndexSet) {
        offsets.map { offerListViewModel.offerViewModel[$0].offer }
            .forEach(offerListViewModel.remove)
    }
}
    
    
    struct Listings_Previews: PreviewProvider {
        static var previews: some View {
            Listings(offerListViewModel: OfferListViewModel())
        }
    }
