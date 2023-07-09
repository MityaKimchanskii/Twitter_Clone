//
//  UserRowView.swift
//  Twitter
//
//  Created by Mitya Kim on 7/8/23.
//

import SwiftUI

struct UserRowView: View {
    
    
    var body: some View {
        HStack(spacing: 12) {
            Circle()
                .frame(width: 48, height: 48)
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Joker")
                    .font(.headline).bold()
                    .foregroundColor(.black)
                
                Text("Dima Kim")
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
        UserRowView()
    }
}
