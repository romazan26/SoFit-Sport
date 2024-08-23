//
//  ComletedGoalView.swift
//  SoFit Sport
//
//  Created by Роман on 23.08.2024.
//

import SwiftUI

struct ComletedGoalView: View {
    @StateObject var vm: GoalViewModal
    @Environment(\.dismiss) var dismis
    var body: some View {
        ZStack {
            //MARK: - Background
            Color.main.ignoresSafeArea()
            //MARK: - Main stack
            VStack {
                //MARK: - Top toolbar
                HStack {
                    //MARK: Back button
                    Button(action: {dismis()}, label: {
                        Image(systemName: "chevron.left")
                            .resizable()
                            .frame(width: 6, height: 11)
                            .foregroundStyle(.gray)
                    })
                    
                    Spacer()
                    
                    //MARK: Title
                    Text("Completed goals")
                        .foregroundStyle(.white)
                        .font(.system(size: 20, weight: .heavy))
                    Spacer()
                }
                
                //MARK: - Goals list
                ScrollView {
                    ForEach(vm.completedGoal) { goal in
                        GoalCellView(vm: vm, goal: goal)
                    }
                }.padding(.vertical)
                
                Spacer()
            }
            .padding()
            .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    ComletedGoalView(vm: GoalViewModal())
}
