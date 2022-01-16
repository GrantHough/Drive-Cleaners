//
//  DescriptionPopup.swift
//  LaundryApp
//
//  Created by Grant Hough on 1/15/22.
//

import SwiftUI

class Close: ObservableObject {
    
    @Published var showing = false
    
}


struct Popup: View {
    
    @EnvironmentObject var close: Close
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        
        VStack {
            
            Text("I like dogs")
            
            Button(action: {
               
                    viewModel.showing.toggle()
                
            }) {
                Image(systemName: "xmark").resizable()
                    .frame(width: 16, height: 16)
                    .foregroundColor(.black)
                    .padding(15)
            }
        }
        
        
        .frame(width: UIScreen.main.bounds.width - 40, height: UIScreen.main.bounds.height - 200)
        .background(Color.white)
        .shadow(radius: 10)
    }
    
}
