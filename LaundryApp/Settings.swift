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

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
