//
//  AddworkoutView.swift
//  SoFit Sport
//
//  Created by Роман on 22.08.2024.
//

import SwiftUI

struct AddworkoutView: View {
    @StateObject var vm: WorkoutsViewModel
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
                    
                    if vm.isNewWorkout || vm.isEditTtle {
                        TextFieldCustomView(placeholder: "New workout", text: $vm.simleWorkOutTitle)
                        
                        Spacer()
                        Button(action: {
                            if vm.isNewWorkout {
                                vm.addWorkout()
                                vm.isNewWorkout = false
                            }
                            if vm.isEditTtle {
                                vm.isEditTtle = false
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
                                ZStack {
                                    Color(.main)
                                        .cornerRadius(6)
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 19)
                                                .stroke(.second, lineWidth: 2.0)
                                        }
                                        Image(systemName: "plus")
                                            .resizable()
                                            .frame(width: 20, height: 20)
                                            .foregroundStyle(.gray)
                                }
                                .frame(width: 358, height: 72)
                    })
                }
                Spacer()
                
            }.padding()
            if vm.isPresentAddTraining {
                AddNewTrainingView(vm: vm)
            }
        }
    }
}

#Preview {
    AddworkoutView(vm: WorkoutsViewModel())
}
