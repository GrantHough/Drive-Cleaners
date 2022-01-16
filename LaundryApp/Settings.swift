//
//  Settings.swift
//  LaundryApp
//
//  Created by Grant Hough on 1/15/22.
//

import SwiftUI

struct Settings: View {
    
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
      
        NavigationView {
            
            ZStack {
                
                LinearGradient(gradient: Gradient(colors: [Color.white, Color.blue]), startPoint: .top, endPoint: .bottomLeading)
                
                VStack {
                
                    Text("Settings")
                        .font(.custom("Avenir", size: UIScreen.main.bounds.width * 0.1))
                        .foregroundColor(Color.white)
                        .fontWeight(.bold)
                        .padding(5)
                        .shadow(radius: 10)
                    
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
                }
            }
            .ignoresSafeArea()
        }
        .navigationBarTitle("Settings")
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
