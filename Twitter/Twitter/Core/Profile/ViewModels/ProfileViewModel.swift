//
//  ProfileViewModel.swift
//  Twitter
//
//  Created by Mitya Kim on 7/25/23.
//

import Foundation


class ProfileViewModel: ObservableObject {
    
    @Published var tweets = [Tweet]()
    
    let service = TweetService()
    let user: User
    
    init(user: User) {
        self.user = user
        self.fetchUserTweets()
    }
    
    func fetchUserTweets() {
        service.fetchTweets(forUid: user.id ?? "") { tweets in
            self.tweets = tweets
            
            for i in 0 ..< tweets.count {
                self.tweets[i].user = self.user
            }
        }
    }
}
