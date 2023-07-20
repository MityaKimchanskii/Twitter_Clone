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
    @EnvironmentObject var viewModel: AuthViewModel
    
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
                        .scaledToFill()
                        .frame(width: 180, height: 180)
                        .padding(.top, 44)
                        .clipShape(Circle())
                } else {
                    Image(systemName: "plus.circle")
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(Color(.systemBlue))
                        .scaledToFill()
                        .frame(width: 180, height: 180)
                        .padding(.top, 44)
                }
            }
            .sheet(isPresented: $showImagePicker, onDismiss: loadImage) {
                ImagePicker(selectedImage: $selectedImage)
            }
            
            if let selectedImage = selectedImage {
                Button {
                    viewModel.uploadProfileImage(selectedImage)
                } label: {
                    Text("Continue")
                        .font(.headline)
                        .foregroundColor(Color.white)
                        .frame(width: 330, height: 45)
                        .background(Color(.systemBlue))
                        .clipShape(Capsule())
                        .padding()
                }
                .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
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
