//
//  OneMoreButton.swift
//  SoFit Sport
//
//  Created by Роман on 23.08.2024.
//

import SwiftUI

struct OneMoreButton: View {
    var body: some View {
        ZStack {
            Color(.main)
                .cornerRadius(6)
                .overlay {
                    RoundedRectangle(cornerRadius: 19)
                        .stroke(.second, lineWidth: 2.0)
                }
            Image(systemName: "plus")
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundStyle(.gray)
        }
        .frame(height: 72)
    }
}

#Preview {
    OneMoreButton()
}
