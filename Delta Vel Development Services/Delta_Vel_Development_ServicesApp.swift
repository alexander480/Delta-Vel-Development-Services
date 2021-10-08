//
//  Delta_Vel_Development_ServicesApp.swift
//  Delta Vel Development Services
//
//  Created by Alexander Lester on 2/27/21.
//

import SwiftUI
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        // Setup Firebase
        FirebaseApp.configure()
        
        return true
    }
}

@main
struct Delta_Vel_Development_ServicesApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
