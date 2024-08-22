//
//  ProgressCircleView.swift
//  SoFit Sport
//
//  Created by Роман on 20.08.2024.
//

import SwiftUI


struct ProgressCircleView: View {
    var progress: Float = 60
    var body: some View {
        ZStack{
            Circle()
                .foregroundStyle(.second)
                .padding(5)
            
            Circle()
                .trim(from: 0, to: CGFloat(1 - (progress / 120)))
                .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                .foregroundStyle(.blueApp)
                .rotationEffect(Angle(degrees: 90))
        }.padding()
    }
}

#Preview {
    ProgressCircleView()
}
