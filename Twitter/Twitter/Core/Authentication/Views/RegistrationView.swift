//
//  RegistrationView.swift
//  Twitter
//
//  Created by Mitya Kim on 7/12/23.
//

import SwiftUI

struct RegistrationView: View {
    
    @State private var email = ""
    @State private var username = ""
    @State private var fullName = ""
    @State private var password = ""
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        
        VStack {
            
            NavigationLink(destination: ProfilePhotoSelectorView(), isActive: $viewModel.didAuthUser, label: { })
            
            VStack(alignment: .leading) {
                HStack { Spacer() }
                
                Text("Get started")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                
                Text("Create your account")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
            }
            .frame(height: 260)
            .padding(.leading)
            .background(Color(.systemBlue))
            .foregroundColor(.white)
            .clipShape(RoundedCorner(corners: [.bottomRight]))
            
            VStack(spacing: 39) {
                CustomInputField(imageName: "envelope", placeholderText: "Email", text: $email)
                
                CustomInputField(imageName: "person", placeholderText: "Username", text: $username)
                
                CustomInputField(imageName: "person", placeholderText: "Full name", text: $fullName)
                
                CustomInputField(imageName: "lock", placeholderText: "Password", isSecureField: true, text: $password)
            }
            .padding(32)
            
            
            Button {
                viewModel.register(withEmail: email, password: password, fullname: fullName, username: username)
            } label: {
                Text("Sign Up")
                    .font(.headline)
                    .foregroundColor(Color.white)
                    .frame(width: 330, height: 45)
                    .background(Color(.systemBlue))
                    .clipShape(Capsule())
                    .padding()
            }
            .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
            
            Spacer()
            
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                HStack {
                    Text("Already have an account?")
                        .font(.footnote)
                    
                    Text("Sign In")
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
            }
            .padding(.bottom, 32)
        }
        .ignoresSafeArea()
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
