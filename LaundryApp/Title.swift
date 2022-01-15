//
//  ContentView.swift
//  LaundryApp
//
//  Created by Grant Hough on 1/13/22.
//

import SwiftUI

struct Title: View {
    
    @State var email = ""
    @State var password = ""
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        
        NavigationView {
            
            if viewModel.signedIn {
                HomeScreen()
            }
            
            else {
                
                ZStack {
                    
                    LinearGradient(gradient: Gradient(colors: [Color.white, Color.blue]), startPoint: .top, endPoint: .bottomLeading)
                    
                    VStack(spacing: 0) {
                        
                        Rectangle()
                            .foregroundColor(.white)
                            .frame(width: UIScreen.main.bounds.width * 0.45, height: UIScreen.main.bounds.width * 0.45, alignment: .center)
                            .cornerRadius(40, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                            .padding(60)
                            .shadow(radius: 8)
                        
                        Text("Cool Name")
                            .font(.system(size: UIScreen.main.bounds.width * 0.1))
                            .foregroundColor(Color.white)
                            .fontWeight(.bold)
                            .padding(5)
                            .shadow(radius: 4)
                        
                        
                        Text("Customizable. Convenient.")
                            .frame(alignment: .leading)
                            .foregroundColor(Color.white)
                            .font(.title2)
                            .multilineTextAlignment(.center)
                            .padding(.leading, 30)
                            .padding(.trailing, 30)
                            .shadow(radius: 3)
                        
                        NavigationLink(destination: SignIn()) {
                            
                            HStack {
                                
                                Image("email36")
                                    .frame(alignment: .leading)
                                    .padding(.horizontal)
                                    .shadow(radius: 5)
                                
                                Spacer()
                                
                                Text("Login With Email")
                                    .font(.title3)
                                    .fontWeight(.semibold)
                                    .padding(.trailing, 69)
                                    .foregroundColor(Color.black)
                                
                                Spacer()
                                
                            }
                            .frame(width: UIScreen.main.bounds.width - 50, height: UIScreen.main.bounds.height * 0.07)
                            .background(Color.white)
                            .cornerRadius(25, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                            .opacity(0.98)
                            .shadow(radius: 10)
                        }
                        .padding(.top, 94)
                        .padding(.bottom, 10)
                        
                        HStack {
                            Text("Don't have an account?")
                                .bold()
                                .font(.body)
                            NavigationLink(destination: SignUp()) {
                                Text("Signup")
                                    .bold()
                                    .font(.body)
                                    .foregroundColor(.white)
                                    .opacity(0.9)
                            }
                        }
                    }
                    
                }
                
                .ignoresSafeArea()
            }
        }
        .onAppear() {
            viewModel.signedIn = viewModel.isSignedIn
        }
    }
    
}

struct Title_Previews: PreviewProvider {
    static var previews: some View {
        Title()
    }
}
