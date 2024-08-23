//
//  MainView.swift
//  SoFit Sport
//
//  Created by Роман on 20.08.2024.
//

import SwiftUI

struct MainView: View {
    @StateObject var mainVM = MainViewModel()
    @StateObject var workoutVM = WorkoutsViewModel()
    @StateObject var goalVM = GoalViewModal()
    var body: some View {
        NavigationView {
            ZStack {
                //MARK: - Background
                Color.main.ignoresSafeArea()
                //MARK: - Main stack
                VStack {
                    //MARK: - Top toolbar
                    HStack {
                        Spacer()
                        //MARK: - Logo
                        Image(.logo)
                            .resizable()
                            .frame(width: 134, height: 59)
                            .offset(x: 15)
                        Spacer()
                        //MARK: - Settings button
                        Image(systemName: "gearshape.fill")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .foregroundStyle(.gray)
                    }
                    
                    Spacer()
                    
                    //MARK: - timer
                    ZStack {
                        ProgressCircleView(progress: Float(mainVM.timerRemaining))
                        VStack {
                            Button(action: {
                                mainVM.isRunning ? mainVM.stopTimer()  : mainVM.startTimer()
                            }, label: {
                                Text(!mainVM.isRunning ? "START" : "STOP")
                                    .foregroundStyle(.white)
                                .font(.system(size: 42, weight: .heavy))
                            })
                            
                            Text(mainVM.formatedTime())
                                .foregroundStyle(.white)
                            .font(.system(size: 22, weight: .bold))
                        }
                    }.frame(width: 243, height: 243)
                    
                    Spacer()
                    
                    //MARK: - Workouts and goals
                    HStack{
                        NavigationLink {
                            WorkoutsView(vm: workoutVM)
                        } label: {
                            TrainingsCell(title: "Workouts", firstTraining: workoutVM.workouts.first?.title ?? "")
                        }
                        
                        Spacer()
                        
                        NavigationLink {
                            GoalView(vm: goalVM)
                        } label: {
                            TrainingsCell(title: "Goals", firstTraining: goalVM.goals.first?.title ?? "")
                        }
                    }
                    .padding(.vertical)
                     BlueButtonView(text: "Statistics")
                }.padding()
            }
        }
    }
}

#Preview {
    MainView()
}
