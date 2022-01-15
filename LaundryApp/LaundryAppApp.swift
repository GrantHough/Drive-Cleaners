//
//  LaundryAppApp.swift
//  LaundryApp
//
//  Created by Grant Hough on 1/13/22.
//

import SwiftUI
import Firebase
import FirebaseAuth
@main

struct LaundryApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            let viewModel = AppViewModel()
            Title()
                .environmentObject(viewModel)
        }
        
    }
}



class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        FirebaseApp.configure()
    
        return true
        
    }
}
