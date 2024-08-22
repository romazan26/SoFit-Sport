//
//  TrainingForWorkoutCellView.swift
//  SoFit Sport
//
//  Created by Роман on 22.08.2024.
//

import SwiftUI

struct TrainingForWorkoutCellView: View {
    let training: Training
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)) {
            Color.second.cornerRadius(19)
            VStack(alignment: .leading) {
                Text(training.details ?? "")
                    .foregroundStyle(.gray)
                Text(training.exercise ?? "")
                    .foregroundStyle(.white)
                    .font(.system(size: 22, weight: .heavy))
            }.padding()
        }.frame(height: 72)
    }
}

//#Preview {
//    TrainingForWorkoutCellView()
//}
