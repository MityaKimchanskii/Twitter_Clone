//
//  AuthViewModel.swift
//  Twitter
//
//  Created by Mitya Kim on 7/14/23.
//

import SwiftUI
import Firebase


class AuthViewModel: ObservableObject {
    
    @Published var userSession: FirebaseAuth.User?
    @Published var didAuthUser: Bool = false
    
    init() {
        self.userSession = Auth.auth().currentUser
    }
    
    func login(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("Debug: user failed to sign in: \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else { return }
            self.userSession = user
        }
    }
    
    func register(withEmail email: String, password: String, fullname: String, username: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("Debug: failed to register user: \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else { return }
            
            let data = ["email": email, "fullname": fullname, "username": username.lowercased(), "uid": user.uid]
            
            Firestore.firestore().collection("users").document(user.uid).setData(data) { _ in
                self.didAuthUser = true
            }
        }
    }
    
    func signOut() {
        // sets user session to nil local
        userSession = nil
        
        // signs user out on server
        try? Auth.auth().signOut()
    }
}
