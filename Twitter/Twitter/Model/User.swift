//
//  User.swift
//  Twitter
//
//  Created by Mitya Kim on 7/19/23.
//

import FirebaseFirestoreSwift

struct User: Decodable {
    @DocumentID var id: String?
    let username: String
    let fullname: String
    let profileImageURL: String?
    let email: String
}
