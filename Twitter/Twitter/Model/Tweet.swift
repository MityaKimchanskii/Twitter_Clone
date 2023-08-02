//
//  Tweet.swift
//  Twitter
//
//  Created by Mitya Kim on 7/25/23.
//

import Foundation
import FirebaseFirestoreSwift
import Firebase


struct Tweet: Identifiable, Decodable, Hashable {
    @DocumentID var id: String?
    let caption: String
    let timestamp: Timestamp
    let uid: String
    var likes: Int
    
    var user: User?
    var didLike: Bool?
}
