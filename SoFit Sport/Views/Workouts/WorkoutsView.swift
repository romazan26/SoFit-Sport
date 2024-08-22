//
//  WorkoutsView.swift
//  SoFit Sport
//
//  Created by Роман on 22.08.2024.
//

import SwiftUI

struct WorkoutsView: View {
    @StateObject var vm: WorkoutsViewModel
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
                    
                    Text("Workouts")
                        .foregroundStyle(.white)
                        .font(.system(size: 20, weight: .heavy))
                    Spacer()
                }
                
                //MARK: - List of workout
                ScrollView {
                    ForEach(vm.workouts) { workout in
                        Button(action: {
                            vm.simpleWorkout = workout
                            vm.isPresentWorkout = true
                            vm.isNewWorkout = false
                        }, label: {
                            WorkoutCellView(workout: workout)
                        })
                    }
                }
                Spacer()
                
                Button(action: {
                    vm.isNewWorkout = true
                    vm.isPresentWorkout = true
                }, label: {
                    BlueButtonView(text: "New workout")
                })
                
            }.padding()
                .navigationBarBackButtonHidden()
        }
        .fullScreenCover(isPresented: $vm.isPresentWorkout, content: {
            AddworkoutView(vm: vm)
        })
    }
}

#Preview {
    WorkoutsView(vm: WorkoutsViewModel())
}
