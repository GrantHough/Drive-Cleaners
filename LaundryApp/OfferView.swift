//
//  OfferView.swift
//  LaundryApp
//
//  Created by Grant Hough on 1/15/22.
//

import SwiftUI

struct OfferView: View {
    
    var offerViewModel: OfferViewModel
    @State var showing = false
    @EnvironmentObject var close: Close
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        
        NavigationLink (destination: OfferDemo()){
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.white)
                    .frame(width: UIScreen.main.bounds.width - 50, height: UIScreen.main.bounds.height * 0.1)
                    .overlay (
                        ZStack {
    
                            HStack {
                                Text(offerViewModel.offer.name + "'s offer - $$")
                                    .foregroundColor(.black)
                                    .font(.custom("Avenir", size: 25))
                                
                                
                                //                            Button(action: {
                                //
                                //                                viewModel.showing = true
                                //
                                //                            }, label: {
                                //                                Text("dogs")
                                //                            })
                                
                            }
                            
                            
                        }
                        .padding()
                    )
                
            }
         
        }
        .navigationViewStyle(StackNavigationViewStyle())
        
        
    }
    
}


