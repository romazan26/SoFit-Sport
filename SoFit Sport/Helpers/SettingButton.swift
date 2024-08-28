//
//  SettingButton.swift
//  SoFit Sport
//
//  Created by Роман on 28.08.2024.
//

import SwiftUI


        struct SettingButton: View {
            var text = ""
            var imageName = ""
            var body: some View {
                ZStack {
                    Color(.second)
                        .cornerRadius(25)
                        
                    HStack {
                        Image(systemName: imageName)
                            .resizable()
                            .frame(width: 24, height: 24)
                        Spacer()
                        Text(text)
                        Spacer()
                    }
                    .padding(.horizontal, 35)
                    .foregroundStyle(.white)
                    .font(.system(size: 15, weight: .heavy))
                }
                .frame(width: 336, height: 76)
            }
        }
    


#Preview {
    SettingButton()
}
