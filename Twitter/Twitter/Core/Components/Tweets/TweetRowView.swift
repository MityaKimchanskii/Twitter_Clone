//
//  TweetRowView.swift
//  Twitter
//
//  Created by Mitya Kim on 7/5/23.
//

import SwiftUI

struct TweetRowView: View {
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
                    HStack {
                        Text("Bruce Lee")
                            .font(.subheadline).bold()
                        
                        Text("@dragon")
                            .foregroundColor(Color(.gray))
                            .font(.caption)
                        
                        Text("3w")
                            .foregroundColor(Color(.gray))
                            .font(.caption)
                    }
                    
                    // tweet caption
                    Text("I believe in Heaven")
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
                    // action
                } label: {
                    Image(systemName: "heart")
                        .font(.subheadline)
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

struct TweetRowView_Previews: PreviewProvider {
    static var previews: some View {
        TweetRowView()
    }
}
