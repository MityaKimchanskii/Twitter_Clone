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
    @Published var currentUser: User?
    private var tempUserSession: FirebaseAuth.User?
    
    private let service = UserService()
    
    init() {
        self.userSession = Auth.auth().currentUser
        self.fetchUser()
    }
    
    func login(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("Debug: user failed to sign in: \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else { return }
            self.userSession = user
            self.fetchUser()
        }
    }
    
    func register(withEmail email: String, password: String, fullname: String, username: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("Debug: failed to register user: \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else { return }
            self.tempUserSession = user
            
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
    
    func uploadProfileImage(_ image: UIImage) {
        guard let uid = tempUserSession?.uid else { return }
        
        ImageUploader.uploadImage(image: image) { profileImageURL in
            Firestore.firestore().collection("users")
                .document(uid)
                .updateData(["profileImageURL": profileImageURL]) { _ in
                    self.userSession = self.tempUserSession
                    self.fetchUser()
                }
        }
    }
    
    func fetchUser() {
        guard let uid = self.userSession?.uid else { return }
        
        service.fetchUser(withUid: uid) { user in
            self.currentUser = user
        }
    }
}
