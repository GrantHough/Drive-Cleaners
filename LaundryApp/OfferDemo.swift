//
//  OfferDemo.swift
//  LaundryApp
//
//  Created by Grant Hough on 1/15/22.
//

import SwiftUI

struct OfferDemo: View {
    
    @EnvironmentObject var viewModel: AppViewModel
    @EnvironmentObject var close: Close
    
    var body: some View {
        
        NavigationView {
            VStack {
                
                ZStack {
                    
                    LinearGradient(gradient: Gradient(colors: [Color.white, Color.blue]), startPoint: .top, endPoint: .bottomLeading)
                    
                    VStack(spacing: 0) {
                        
                        Text("Grant's Listing - $$")
                            .font(.custom("Avenir", size: UIScreen.main.bounds.width * 0.08))
                            .foregroundColor(Color.white)
                            .fontWeight(.bold)
                            .padding(5)
                            .shadow(radius: 10)
                        
                        Image("house")
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width - 50, height: UIScreen.main.bounds.height - 600)
                            .cornerRadius(20)
                            .shadow(radius: 10)
                            .padding()
                        
                        VStack (alignment: .leading) {
                            Text("Name: Grant Hough")
                                .font(.custom("Avenir", size: UIScreen.main.bounds.width * 0.052))
                                .foregroundColor(Color.white)
                                .fontWeight(.semibold)
                                .padding(0.5)
                                .padding(.top, 15)
                                .padding(.horizontal, 10)
                            Text("Address: 1234 Hackathon Lane")
                                .font(.custom("Avenir", size: UIScreen.main.bounds.width * 0.052))
                                .foregroundColor(Color.white)
                                .fontWeight(.semibold)
                                .padding(0.5)
                                .padding(.horizontal, 10)
                            Text("Primary Soap: Purex")
                                .font(.custom("Avenir", size: UIScreen.main.bounds.width * 0.052))
                                .foregroundColor(Color.white)
                                .fontWeight(.semibold)
                                .padding(0.5)
                                .padding(.horizontal, 10)
                            Text("Folding: Yes")
                                .font(.custom("Avenir", size: UIScreen.main.bounds.width * 0.052))
                                .foregroundColor(Color.white)
                                .fontWeight(.semibold)
                                .padding(0.5)
                                .padding(.horizontal, 10)
                            Text("Pickup/Delivery: Yes")
                                .font(.custom("Avenir", size: UIScreen.main.bounds.width * 0.052))
                                .foregroundColor(Color.white)
                                .fontWeight(.semibold)
                                .padding(0.5)
                                .padding(.horizontal, 10)
                            Text("Estimated Delivery Time: 2 days")
                                .font(.custom("Avenir", size: UIScreen.main.bounds.width * 0.052))
                                .foregroundColor(Color.white)
                                .fontWeight(.semibold)
                                .padding(0.5)
                                .padding(.horizontal, 10)
                            Text("Email: grant.l.hough@gmail.com")
                                .font(.custom("Avenir", size: UIScreen.main.bounds.width * 0.052))
                                .foregroundColor(Color.white)
                                .fontWeight(.semibold)
                                .padding(0.5)
                                .padding(.horizontal, 10)
                            Text("Other Information: Email me for any other special requests!")
                                .font(.custom("Avenir", size: UIScreen.main.bounds.width * 0.052))
                                .foregroundColor(Color.white)
                                .fontWeight(.semibold)
                                .padding(0.5)
                                .multilineTextAlignment(.leading)
                                .padding(.bottom, 15)
                                .padding(.horizontal, 10)
                        }
                        .cornerRadius(20)
                        .background(Color.black.opacity(0.2))
                        .shadow(radius: 12)
                        .cornerRadius(20)
                        
                        Button(action: {
                        
                            
                        }, label: {
                            HStack {
                                
                                Text("Order")
                                    .font(.title3)
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color.black)
                                
                            }
                            .frame(width: UIScreen.main.bounds.width - 50, height: UIScreen.main.bounds.height * 0.07)
                            .background(Color.white)
                            .cornerRadius(25, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                            .opacity(0.98)
                            .shadow(radius: 10)
                        })
                        .padding(9)
                        
                    }
                    .padding(4)
                    
                }
                
                .ignoresSafeArea()
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        
    }
}

struct OfferDemo_Previews: PreviewProvider {
    static var previews: some View {
        OfferDemo()
    }
}
