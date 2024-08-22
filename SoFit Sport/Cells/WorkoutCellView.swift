//
//  WorkoutCellView.swift
//  SoFit Sport
//
//  Created by Роман on 22.08.2024.
//

import SwiftUI

struct WorkoutCellView: View {
    
    let workout: Workouts
    
    var body: some View {
        ZStack {
            Color.second.cornerRadius(19)
            HStack {
                VStack(alignment: .leading) {
                    Text("2h 30min")
                        .foregroundStyle(.gray)
                    .font(.system(size: 14))
                    Text(workout.title ?? "")
                        .foregroundStyle(.white)
                        .font(.system(size: 22,weight: .bold))
                }
                
                Spacer()
                if let trainings = workout.training?.allObjects as? [Training]{
                    Text("\(trainings.count) ex")
                        .foregroundStyle(.white)
                        .font(.system(size: 18,weight: .bold))
                        .padding(6)
                        .background {Color.blueApp.cornerRadius(22)}
                        .padding(.horizontal, 20)
                }
                
                
                Image(systemName: "chevron.right")
                    .resizable()
                    .foregroundStyle(.white)
                    .frame(width: 8, height: 12)
            }.padding()
        }.frame(height: 73)
    }
}

//#Preview {
//    WorkoutCellView(workout: Workouts())
//}
