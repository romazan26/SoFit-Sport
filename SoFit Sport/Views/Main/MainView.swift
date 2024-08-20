//
//  MainView.swift
//  SoFit Sport
//
//  Created by Роман on 20.08.2024.
//

import SwiftUI

struct MainView: View {
    var body: some View {
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
                    ProgressCircleView(progress: 0.3)
                    VStack {
                        Text("STOP")
                            .foregroundStyle(.white)
                        .font(.system(size: 42, weight: .heavy))
                        Text("13:50")
                            .foregroundStyle(.white)
                        .font(.system(size: 22, weight: .bold))
                    }
                }.frame(width: 243, height: 243)
                
                Spacer()
            }.padding()
        }
    }
}

#Preview {
    MainView()
}
