//
//  TrainingTextFieldView.swift
//  SoFit Sport
//
//  Created by Роман on 22.08.2024.
//

import SwiftUI

struct TrainingTextFieldView: View {
    @Binding var text: String
    var body: some View {
        ZStack(alignment: .leading) {
            Color.second
            
            VStack(spacing: 0) {
                TextField("", text: $text)
                .foregroundStyle(.white)
                .font(.system(size: 19, weight: .bold))
                .padding(.horizontal, 5)
                Rectangle()
                    .foregroundStyle(.gray)
                    .frame(height: 1)
            }
        }
        .cornerRadius(12)
        .frame(width: 260)
        .frame(height: 28)
    }
}

#Preview {
    TrainingTextFieldView(text: .constant(""))
}
