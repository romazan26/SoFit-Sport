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
    
    private var timer: Timer?
    
    
    
    //MARK: - Timer
    func formatedTime() -> String{
        let minutes = Int(timerRemaining) / 60
        let second = Int(timerRemaining) % 60
        return String(format: "%02d:%02d", minutes, second)
    }
    
    func startTimer(){
        isRunning = true
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [self] _ in
            if timerRemaining > 0{
                timerRemaining -= 1
            }else {
                stopTimer()
            }
        }
    }
    
    func stopTimer(){
        isRunning = false
        timer?.invalidate()
        timerRemaining = 120
    }
        
}
