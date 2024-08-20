//
//  ProgressCircleView.swift
//  SoFit Sport
//
//  Created by Роман on 20.08.2024.
//

import SwiftUI


struct ProgressCircleView: View {
    var progress: Float = 0.3
    var body: some View {
        ZStack{
            Circle()
                .foregroundStyle(.second)
                .padding(5)
            
            Circle()
                .trim(from: 0.0, to: CGFloat(min(self.progress, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                .foregroundStyle(.blueApp)
                .rotationEffect(Angle(degrees: 270))
        }.padding()
    }
}

#Preview {
    ProgressCircleView()
}
