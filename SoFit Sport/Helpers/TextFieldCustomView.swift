//
//  TextFieldCustomView.swift
//  SoFit Sport
//
//  Created by Роман on 22.08.2024.
//

import SwiftUI

struct TextFieldCustomView: View {
    var placeholder = ""
    @Binding var text: String
    var body: some View {
        ZStack(alignment: .leading) {
            Color.second
            if text.isEmpty {
                Text(placeholder)
                    .padding()
                    .foregroundStyle(.white.opacity(0.4))
            }
            TextField("", text: $text)
                .padding()
                .foregroundStyle(.white)
        }
        .cornerRadius(19)
        .frame(maxWidth: .infinity)
        .frame(height: 72)
    }
}

#Preview {
    TextFieldCustomView( text: .constant(""))
}
