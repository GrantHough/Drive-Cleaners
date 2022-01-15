//
//  ContentView.swift
//  LaundryApp
//
//  Created by Grant Hough on 1/13/22.
//

import SwiftUI

struct Title: View {
    var body: some View {
        VStack (alignment: .leading) {
            Text("App Name")
            Rectangle()
                .foregroundColor(.blue)
                .frame(width: UIScreen.main.bounds.width * 0.75, height: UIScreen.main.bounds.width * 0.75)
                .cornerRadius(40, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
            Text("Laundry App")
            Text("The future of laundry is here")
        }
    }
}

struct Title_Previews: PreviewProvider {
    static var previews: some View {
        Title()
    }
}
