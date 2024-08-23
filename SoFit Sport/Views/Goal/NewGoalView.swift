//
//  NewGoalView.swift
//  SoFit Sport
//
//  Created by Роман on 23.08.2024.
//

import SwiftUI

struct NewGoalView: View {
    @StateObject var vm: GoalViewModal
    @FocusState private var keyboardIsFocus: Bool
    var body: some View {
        ZStack {
            Color.main.opacity(0.5).ignoresSafeArea()
            ZStack {
                Color.second.cornerRadius(24)
                VStack {
                    Spacer()
                    //MARK: - Deteils
                    HStack {
                        Text("Goal")
                            .foregroundStyle(.gray)
                        Spacer()
                        TrainingTextFieldView(text: $vm.simpleTitle)
                            .focused($keyboardIsFocus)
                    }
                    //MARK: - Exercise
                    HStack {
                        Text("Exercise")
                            .foregroundStyle(.gray)
                        Spacer()
                        TrainingTextFieldView(text: $vm.simpleExercise)
                            .focused($keyboardIsFocus)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        vm.addGoal()
                    }, label: {
                        BlueButtonView(text: "Create")
                    })
                    
                }.padding()
            }.frame(height: 200)
                .onTapGesture {
                    keyboardIsFocus = false
                }
        }
    }
}

#Preview {
    NewGoalView(vm: GoalViewModal())
}
