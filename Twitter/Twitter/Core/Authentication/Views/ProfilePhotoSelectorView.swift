//
//  ProfilePhotoSelectorView.swift
//  Twitter
//
//  Created by Mitya Kim on 7/18/23.
//

import SwiftUI

struct ProfilePhotoSelectorView: View {
    
    @State private var showImagePicker: Bool = false
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    
    var body: some View {
        
        VStack {
            VStack(alignment: .leading) {
                HStack { Spacer() }
                
                Text("Create your account")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                
                Text("Select a profile photo")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
            }
            .frame(height: 260)
            .padding(.leading)
            .background(Color(.systemBlue))
            .foregroundColor(.white)
            .clipShape(RoundedCorner(corners: [.bottomRight]))
            
            Button {
                showImagePicker.toggle()
            } label: {
                if let profileImage = profileImage {
                    profileImage
                        .resizable()
                        .renderingMode(.original)
                        .scaledToFill()
                        .frame(width: 150, height: 150)
                        .padding(.top, 44)
                        .clipShape(Circle())
                } else {
                    Image(systemName: "plus.circle")
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(Color(.systemBlue))
                        .scaledToFill()
                        .frame(width: 150, height: 150)
                        .padding(.top, 44)
                }
            }
            .sheet(isPresented: $showImagePicker, onDismiss: loadImage) {
                ImagePicker(selectedImage: $selectedImage)
            }
            
            Spacer()
        }
        .ignoresSafeArea()
    }
    
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        profileImage = Image(uiImage: selectedImage)
    }
    
}


struct ProfilePhotoSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoSelectorView()
    }
}
