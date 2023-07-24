//
//  UserRowView.swift
//  Twitter
//
//  Created by Mitya Kim on 7/8/23.
//

import SwiftUI
import Kingfisher

struct UserRowView: View {
    
    let user: User
    
    var body: some View {
        HStack(spacing: 12) {
            Circle()
                .frame(width: 48, height: 48)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(user.username)
                    .font(.headline).bold()
                    .foregroundColor(.black)
                
                Text(user.fullname)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            Spacer()
        }
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
}

struct UserRowView_Previews: PreviewProvider {
    static var previews: some View {
        UserRowView(user: User(username: "Bruce", fullname: "Bruce Lee", profileImageURL: "", email: "brucelee@gmail.com"))
    }
}
