//
//  OfferView.swift
//  LaundryApp
//
//  Created by Grant Hough on 1/15/22.
//

import SwiftUI

struct OfferView: View {
    
    var offerViewModel: OfferViewModel
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(Color.blue)
            .frame(height: UIScreen.main.bounds.height * 0.1)
            .overlay (
                ZStack {
                    HStack {
                        Spacer()
                        VStack {
                            Image(systemName: offerViewModel.offer.folding ? "book" : "gear")
                            Spacer()
                        }
                    }
                    Text(offerViewModel.offer.address + offerViewModel.offer.name)
                        .foregroundColor(.white)
                        .font(.custom("Avenir", size: 25))
                }
                .padding()
            )
        
    }
}

