//
//  TweetRowView.swift
//  Twitter
//
//  Created by Mitya Kim on 7/5/23.
//

import SwiftUI

struct TweetRowView: View {
    
    @ObservedObject var viewModel: TweetRowViewModel
    
    init(tweet: Tweet) {
        self.viewModel = TweetRowViewModel(tweet: tweet)
    }
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            // profile image + user info + tweet
            HStack(alignment: .top, spacing: 12) {
                Circle()
                    .frame(width: 56, height: 56)
                    .foregroundColor(Color(.systemBlue))
                
                // user info & tweet caption
                VStack(alignment: .leading, spacing: 4) {
                    // user info
                    if let user = viewModel.tweet.user {
                        HStack {
                            Text(user.fullname)
                                .font(.subheadline).bold()
                            
                            Text(user.username)
                                .foregroundColor(Color(.gray))
                                .font(.caption)
                            
                            Text("3w")
                                .foregroundColor(Color(.gray))
                                .font(.caption)
                        }
                    }
                    
                    // tweet caption
                    Text(viewModel.tweet.caption)
                        .font(.caption)
                        .multilineTextAlignment(.leading)
                }
            }
            // actions buttons
            HStack {
                Button {
                    // action
                } label: {
                    Image(systemName: "bubble.left")
                        .font(.subheadline)
                }
                Spacer()
                
                Button {
                    // action
                } label: {
                    Image(systemName: "arrow.2.squarepath")
                        .font(.subheadline)
                }
                Spacer()
                
                Button {
                    viewModel.tweet.didLike ?? false ? viewModel.unlikeTweet() : viewModel.likeTweet()
                } label: {
                    Image(systemName: viewModel.tweet.didLike ?? false ? "heart.fill" : "heart")
                        .font(.subheadline)
                        .foregroundColor(viewModel.tweet.didLike ?? false ? .red : .gray)
                }
                Spacer()
                
                Button {
                    // action
                } label: {
                    Image(systemName: "bookmark")
                        .font(.subheadline)
                }
            }
            .padding()
            .foregroundColor(.gray)
            
            Divider()
        }
        .padding()
    }
}

//struct TweetRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        TweetRowView(tweet: .init(caption: "Hello Dima Kim iOS Developer", timestamp: 31T23:59:59.999999999Z, uid: "dkdf", likes: 100000000))
//    }
//}
