//
//  WorkoutsCell.swift
//  SoFit Sport
//
//  Created by Роман on 22.08.2024.
//

import SwiftUI

struct TrainingsCell: View {
    var title = ""
    var firstTraining = ""
    var body: some View {
        ZStack {
            Color.second.cornerRadius(17)
            VStack {
                HStack {
                    Text(title)
                        .foregroundStyle(.gray)
                        .font(.system(size: 14, weight: .bold))
                    Spacer()
                    Image(systemName: "chevron.right")
                        .resizable()
                        .foregroundStyle(.white)
                        .frame(width: 6, height: 9)
                }
                Spacer()
                HStack{
                    Image(systemName: "clock.fill")
                        .foregroundStyle(.blueApp)
                    Spacer()
                    Text(firstTraining)
                        .foregroundStyle(.white)
                        .font(.system(size: 18, weight: .bold))
                    Spacer()
                }
                Spacer()
            }.padding()
        }.frame(width: 166, height: 95)
    }
}

#Preview {
    TrainingsCell(title: "Workouts", firstTraining: "In the gym" )
}
