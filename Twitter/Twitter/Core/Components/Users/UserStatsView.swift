//
//  UserStatsView.swift
//  Twitter
//
//  Created by Mitya Kim on 7/11/23.
//

import SwiftUI

struct UserStatsView: View {
    var body: some View {
        HStack(spacing: 23) {
            HStack(spacing: 4) {
                Text("999")
                    .font(.subheadline)
                    .bold()
                
                Text("Following")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            HStack {
                HStack {
                    Text("7.7M")
                        .font(.subheadline)
                        .bold()
                    
                    Text("Followers")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
        }
    }
}

struct UserStatsView_Previews: PreviewProvider {
    static var previews: some View {
        UserStatsView()
    }
}
