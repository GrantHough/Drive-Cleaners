//
//  Listings.swift
//  LaundryApp
//
//  Created by Grant Hough on 1/15/22.
//

import SwiftUI

struct Listings: View {
    
    @ObservedObject var offerListViewModel: OfferListViewModel
    @State private var showingForm = false
    @State private var showFolding = false
    @State private var showDelivery = false
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        
        ZStack {
            
            LinearGradient(gradient: Gradient(colors: [Color.white, Color.blue]), startPoint: .top, endPoint: .bottomLeading).edgesIgnoringSafeArea(.all)
            
            VStack (spacing: 0) {
                
                Text("Listings")
                    .font(.custom("Avenir", size: UIScreen.main.bounds.width * 0.1))
                    .foregroundColor(Color.white)
                    .fontWeight(.bold)
                    .shadow(radius: 10)
                
                //  Text("")
                //   List(Manager.listings, id: \.name) { xx in
                //       VStack{
                //         Text(xx.name)
                //    Text(xx.address)
                //  }
                //
                //                    Toggle(isOn: $showDelivery) { Text("\(showDelivery ? "Hide" : "Show") offers that include delivery") }
                //                        .font(.custom("Avenir", size: UIScreen.main.bounds.width * 0.052))
                
                ScrollView {
                    
                    Spacer()
                        .frame(height: 10)
                    
                    ForEach (offerListViewModel.offerViewModel.filter {
                                $0.offer.delivery == showDelivery || true }) { offerVM in
                        OfferView(offerViewModel: offerVM)
                    }
                    .onDelete(perform: delete)
                    
                }
                .frame(width: UIScreen.main.bounds.width - 20, height: UIScreen.main.bounds.height * 0.5)
                .background(Color.black.opacity(0.1))
                .cornerRadius(25)
                .listStyle(InsetListStyle())
                .shadow(radius: 12)
                .padding(.bottom, 12)
                
                Button(action: {
                    showingForm = true
                }) {
                    Circle()
                        .fill(Color.white)
                        .frame(height: 60)
                        .overlay(Image(systemName: "plus").foregroundColor(.black))
                }
                .sheet(isPresented: $showingForm) {
                    FormView { (offer) in
                        offerListViewModel.add(offer)
                        showingForm = false
                    }
                }
                .shadow(radius: 5)
                
                Spacer()
                    .frame(height: UIScreen.main.bounds.height * 0.2)
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
