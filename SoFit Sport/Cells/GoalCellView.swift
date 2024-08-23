//
//  GoalCellView.swift
//  SoFit Sport
//
//  Created by Роман on 23.08.2024.
//

import SwiftUI

struct GoalCellView: View {
    @StateObject var  vm: GoalViewModal
    @ObservedObject var goal: Goal
    var body: some View {
        ZStack {
            Color(goal.comleted ? .blueApp : .second)
                .cornerRadius(19)
            HStack {
                VStack(alignment: .leading) {
                    Text(goal.title ?? "")
                        .foregroundStyle(goal.comleted ? .black.opacity(0.59) : .gray)
                        .font(.system(size: 14))
                    Text(goal.exercise ?? "")
                        .foregroundStyle(.white)
                        .font(.system(size: 22, weight: .heavy))
                }
                Spacer()
                
                //MARK: - Comleted button
                Button(action: {vm.comletedGoal(gola: goal)}, label: {
                    if goal.comleted {
                        Image(systemName: "checkmark.circle.fill")
                            .resizable()
                            .frame(width: 26, height: 26)
                            .foregroundStyle(.black)
                    }else{
                        Circle()
                            .frame(width: 26)
                            .padding(.horizontal)
                            .foregroundStyle(.gray)
                    }
                })
                .disabled(goal.comleted ? true : false)
            }.padding()
        }.frame(height: 73)
    }
}

//#Preview {
//    GoalCellView(vm: GoalViewModal(), goal: Goal())
//}
