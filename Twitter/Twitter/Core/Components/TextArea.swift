//
//  TextArea.swift
//  Twitter
//
//  Created by Mitya Kim on 7/11/23.
//

import SwiftUI

struct TextArea: View {
    
    
    @Binding var text: String
    let placeholder: String
    
    init(placeholder: String, text: Binding<String>) {
        self.placeholder = placeholder
        self._text = text
        UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View {

        VStack(alignment: .center) {
            ZStack(alignment: .topLeading) {
                
                if text.isEmpty {
                    Text(placeholder)
                        .foregroundColor(Color(.placeholderText))
                        .padding(.horizontal, 8)
                        .padding(.vertical, -16)
                }
                
                TextEditor(text: $text)
                    .padding(4)
            }
            .font(.body)
        }
    }
}


struct TextArea_Previews: PreviewProvider {
    
    static var previews: some View {
        @State var caption = ""
        TextArea(placeholder: "Hello World Hello World!", text: $caption)
    }
}
