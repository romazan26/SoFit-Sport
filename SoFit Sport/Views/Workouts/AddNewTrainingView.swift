//
//  AddNewTrainingView.swift
//  SoFit Sport
//
//  Created by Роман on 22.08.2024.
//

import SwiftUI

struct AddNewTrainingView: View {
    @StateObject var vm: WorkoutsViewModel
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
                        Text("Details")
                            .foregroundStyle(.gray)
                        Spacer()
                        TrainingTextFieldView(text: $vm.simleTrainingDetails)
                            .focused($keyboardIsFocus)
                    }
                    //MARK: - Exercise
                    HStack {
                        Text("Exercise")
                            .foregroundStyle(.gray)
                        Spacer()
                        TrainingTextFieldView(text: $vm.simleTrainingExercise)
                            .focused($keyboardIsFocus)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        vm.addTrainig()
                        vm.isPresentAddTraining = false
                    }, label: {
                        BlueButtonView(text: "Create")
                    })
                    
                }.padding()
            }.frame(height: 200)
        }
        .onTapGesture {
            keyboardIsFocus = false
        }
    }
}

#Preview {
    AddNewTrainingView(vm: WorkoutsViewModel())
}
