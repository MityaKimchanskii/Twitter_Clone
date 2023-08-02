//
//  TweetRowViewModel.swift
//  Twitter
//
//  Created by Mitya Kim on 8/1/23.
//

import Foundation


class TweetRowViewModel: ObservableObject {
    
    private let service = TweetService()
    @Published var tweet: Tweet
    
    init(tweet: Tweet) {
        self.tweet = tweet
        ifUserLikedTweet()
    }
    
    func likeTweet() {
        service.likeTweet(tweet) {
            self.tweet.didLike = true
        }
    }
    
    func unlikeTweet() {
        service.unlikeTweet(tweet) {
            self.tweet.didLike = false
        }
    }
    
    func ifUserLikedTweet() {
        service.checkTweetLike(tweet) { didLike in
            if didLike {
                self.tweet.didLike = true
            }
        }
    }
}
