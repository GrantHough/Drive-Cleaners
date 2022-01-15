//
//  HomeScreen.swift
//  LaundryApp
//
//  Created by Grant Hough on 1/15/22.
//

import SwiftUI

struct HomeScreen: View {
    
    @EnvironmentObject var viewModel: AppViewModel

    var body: some View {
       
        NavigationView {
            
            TabView {
               
                Listings()
                    .tabItem {
                        Image(systemName:"book")
                        Text("Listings")
                    }
                
                CreateListing()
                    .tabItem {
                        Image(systemName:"upload")
                        Text("Create Listing")
                    }
                
                Settings()
                    .tabItem {
                        Image(systemName:"gear")
                        Text("Settings")
                    }
                
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
