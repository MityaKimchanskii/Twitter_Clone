//
//  UploadTweetViewModel.swift
//  Twitter
//
//  Created by Mitya Kim on 7/24/23.
//

import Foundation


class UploadTweetViewModel: ObservableObject {
    
    @Published var didUploadTweet = false
    
    let service = TweetService()
    
    func uploadTweet(withCaption caption: String) {
        service.uploadTweet(caption: caption) { success in
            if success {
                self.didUploadTweet = true
            } else {
                
            }
        }
    }
}
