//
//  AddworkoutView.swift
//  SoFit Sport
//
//  Created by Роман on 22.08.2024.
//

import SwiftUI

struct AddworkoutView: View {
    @StateObject var vm: WorkoutsViewModel
    @FocusState private var keyboardIsFocus: Bool
    var body: some View {
        ZStack {
            //MARK: - Background
            Color.main.ignoresSafeArea()
            //MARK: - Main stack
            VStack {
                //MARK: - Top toolbar
                HStack {
                    //MARK: - Back button
                    Button(action: {vm.isPresentWorkout = false}, label: {
                        Image(systemName: "chevron.left")
                            .resizable()
                            .frame(width: 6, height: 11)
                            .foregroundStyle(.gray)
                    })
                    
                    Spacer()
                    
                    //MARK: - Text field title workout
                    if vm.isNewWorkout || vm.isEditTtle {
                        TextFieldCustomView(placeholder: "New workout", text: $vm.simleWorkOutTitle)
                            .focused($keyboardIsFocus)
                        
                        Spacer()
                        
                        //MARK: - Save button
                        Button(action: {
                            if vm.isNewWorkout {
                                vm.addWorkout()
                                vm.isNewWorkout = false
                            }
                            if vm.isEditTtle {
                                vm.isEditTtle = false
                                vm.editWorkout()
                            }
                        }, label: {
                            Image(systemName: "checkmark.gobackward")
                                .foregroundStyle(.gray)
                        })
                    }else{
                        Text(vm.simpleWorkout.title ?? "")
                            .foregroundStyle(.white)
                            .font(.system(size: 20, weight: .heavy))
                        Spacer()
                        
                        Button(action: {
                            vm.isEditTtle = true
                            
                        }, label: {
                            Image(systemName: "pencil")
                                .foregroundStyle(.gray)
                        })
                    }
                }
                
                //MARK: - training list
                if !vm.isNewWorkout {
                    ScrollView{
                        if let trainings = vm.simpleWorkout.training?.allObjects as? [Training] {
                            ForEach(trainings) { training in
                                TrainingForWorkoutCellView(training: training)
                            }
                        }
                        //MARK: - One training plus
                        Button(action: {
                            if !vm.isNewWorkout{
                                vm.isPresentAddTraining = true
                            }
                            
                        }, label: {
                           OneMoreButton()
                        })
                    }
                }
                Spacer()
                
                //MARK: - Time workout
                if vm.isEditTtle || vm.isNewWorkout {
                    DatePicker("Workout TIme",
                               selection: $vm.simpleWorkoutTime,
                               displayedComponents: .hourAndMinute)
                    .preferredColorScheme(.dark)
                    .padding()
                    .background {
                        Color.second
                            .cornerRadius(19)
                    }
                }
                if !vm.isNewWorkout{
                    if let trainings = vm.simpleWorkout.training?.allObjects as? [Training]{
                        Text("\(trainings.count) ex")
                            .foregroundStyle(.white)
                            .font(.system(size: 28,weight: .bold))
                            .padding(6)
                            .background {Color.blueApp.cornerRadius(22)}
                            .padding(.horizontal, 20)
                    }
                }
            }.padding()
            if vm.isPresentAddTraining {
                AddNewTrainingView(vm: vm)
            }
        }
        .onTapGesture {
            keyboardIsFocus = false
        }
    }
}

#Preview {
    AddworkoutView(vm: WorkoutsViewModel())
}
