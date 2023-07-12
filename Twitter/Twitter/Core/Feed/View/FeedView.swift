//
//  FeedView.swift
//  Twitter
//
//  Created by Mitya Kim on 7/5/23.
//

import SwiftUI

struct FeedView: View {
    
    @State private var showTweetView = false
    
    var body: some View {
        
        ZStack(alignment: .bottomTrailing) {
            ScrollView {
                LazyVStack {
                    ForEach(0...20, id: \.self) { _ in
                        TweetRowView()
                    }
                }
            }
            
            Button {
                showTweetView.toggle()
            } label: {
                Image(systemName: "pencil.and.outline")
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 28, height: 28)
                    .padding()
            }
            .background(Color(.systemBlue))
            .foregroundColor(.white)
            .clipShape(Circle())
            .padding()
            
            .fullScreenCover(isPresented: $showTweetView) {
                NewTweetView()
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
