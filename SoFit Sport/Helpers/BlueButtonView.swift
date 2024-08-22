//
//  BlueButtonView.swift
//  SoFit Sport
//
//  Created by Роман on 22.08.2024.
//

import SwiftUI

struct BlueButtonView: View {
    var text = ""
    var body: some View {
        ZStack {
            Color.blueApp
                .cornerRadius(16)
            Text(text)
                .foregroundStyle(.white)
                .font(.system(size: 16, weight: .heavy))
        }.frame(height: 63)
    }
}

#Preview {
    BlueButtonView(text: "Statistics" )
}
