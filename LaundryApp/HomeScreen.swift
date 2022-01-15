//
//  HomeScreen.swift
//  LaundryApp
//
//  Created by Grant Hough on 1/15/22.
//

import SwiftUI

struct HomeScreen: View {
    
    @EnvironmentObject var viewModel: AppViewModel
    
    @State var x: [LaundryHouse] = [ LaundryHouse(name: "Joan Singh", address: "6969 420 Streat WeedLansd USA"), LaundryHouse(name: "weedDealer", address: "I like doing weed at 1234 alphabet soup lane"), LaundryHouse(name: "Grant Hough", address: "14803 Granite Way"), LaundryHouse(name: "Neal Malhotra", address: "13030 La Vista Drive")]
    //hi grant
    var body: some View {
        NavigationView {
            if viewModel.signedIn {
                VStack {
                    Text("")
                    List(x, id: \.name) { xx in
                        VStack{
                            Text(xx.name)
                            Text(xx.address)
                        }
                        
                    }
                    
                    Button(action: {
                        
                        viewModel.signOut()
                        
                    }, label: {
                        HStack {
                            
                            Text("Sign Out")
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
                    .padding()
                }
            }
            else {
                Title()
            }
            
        }
        .onAppear {
            viewModel.signedIn = viewModel.isSignedIn
        }
    }
}



struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
