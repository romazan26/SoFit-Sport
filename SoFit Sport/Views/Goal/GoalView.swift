//
//  GoalView.swift
//  SoFit Sport
//
//  Created by Роман on 23.08.2024.
//

import SwiftUI

struct GoalView: View {
    
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
                    //MARK: - Settings button
                    Button(action: {dismis()}, label: {
                        Image(systemName: "chevron.left")
                            .resizable()
                            .frame(width: 6, height: 11)
                            .foregroundStyle(.gray)
                    })
                    
                    
                    Spacer()
                    
                    Text("Goals")
                        .foregroundStyle(.white)
                        .font(.system(size: 20, weight: .heavy))
                    Spacer()
                }
                
                //MARK: - Goals list
                ScrollView {
                    ForEach(vm.noCompletedGoal) { goal in
                        GoalCellView(vm: vm, goal: goal)
                    }
                    Button(action: {vm.isPresentAddGoal = true}, label: {
                        OneMoreButton()
                    })
                }.padding(.vertical)
                
                Spacer()
                
                //MARK: - Comleted goal view
                NavigationLink {
                    ComletedGoalView(vm: vm)
                } label: {
                    ZStack {
                        Color.second
                            .cornerRadius(16)
                        Text("Completed")
                            .foregroundStyle(.white)
                            .font(.system(size: 16, weight: .heavy))
                    }.frame(height: 63)
                }
            }.padding()

            //MARK: - New goal view
            if vm.isPresentAddGoal {
                NewGoalView(vm: vm)
            }
               
        }
        .animation(.linear(duration: 1), value: vm.completedGoal)
        .animation(.linear(duration: 1), value: vm.goals)
        .navigationBarBackButtonHidden()
        .onAppear(perform: {
            vm.sortedGoals()
        })
    }
}

#Preview {
    GoalView(vm: GoalViewModal())
}
