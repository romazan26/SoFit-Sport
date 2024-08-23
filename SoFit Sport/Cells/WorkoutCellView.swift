//
//  WorkoutCellView.swift
//  SoFit Sport
//
//  Created by Роман on 22.08.2024.
//

import SwiftUI

struct WorkoutCellView: View {
    
    @ObservedObject var workout: Workouts
    
    var body: some View {
        ZStack {
            Color.second.cornerRadius(19)
            HStack {
                VStack(alignment: .leading) {
                    Text(Dateformatter(date: workout.time ?? Date()))
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
    //MARK: - Dateformatter
    private func Dateformatter(date: Date) -> String{
        let hours = DateFormatter()
        hours.dateFormat = "H"
        
        let menut = DateFormatter()
        menut.dateFormat = "mm"
        let dateString = "\(hours.string(from: date))h \(menut.string(from: date))min"
        return dateString
    }
}

//#Preview {
//    WorkoutCellView(workout: Workouts())
//}
