//
//  ExplereViewModel.swift
//  Twitter
//
//  Created by Mitya Kim on 7/23/23.
//

import Foundation


class ExploreViewModel: ObservableObject {
    @Published var users = [User]()
    
    let service = UserService()
    
    init() {
        fetchUsers()
    }
    
    func fetchUsers() {
        service.fetchUsers { users in
            self.users = users
            print("Hello all users")
        }
    }
}
