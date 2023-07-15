//
//  TwitterApp.swift
//  Twitter
//
//  Created by Mitya Kim on 7/5/23.
//

import SwiftUI
import Firebase
import FirebaseCore


@main
struct TwitterApp: App {
    
    @StateObject var viewModel = AuthViewModel()
  
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
            .environmentObject(viewModel)
        }
    }
}
