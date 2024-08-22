//
//  ViewModel.swift
//  SoFit Sport
//
//  Created by Роман on 22.08.2024.
//

import Foundation

final class MainViewModel: ObservableObject{
    @Published var timerRemaining = 120
    @Published var isRunning = false
    
    
    
    //MARK: - Timer
    func formatedTime() -> String{
        let minutes = Int(timerRemaining) / 60
        let second = Int(timerRemaining) % 60
        return String(format: "%02d:%02d", minutes, second)
    }
    
    func startTimer(){
        isRunning = true
        timerRemaining = 120
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [self] timer in
            if timerRemaining > 0{
                timerRemaining -= 1
            }else {
                isRunning = false
                timer.invalidate()
            }
        }
    }
        
}
