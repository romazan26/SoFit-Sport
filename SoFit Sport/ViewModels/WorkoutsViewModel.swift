//
//  WorkoutsViewModel.swift
//  SoFit Sport
//
//  Created by Роман on 22.08.2024.
//

import Foundation
import CoreData

final class WorkoutsViewModel: ObservableObject{
    
    let manager = CoreDataManager.instance
    
    @Published var workouts:[Workouts] = []
    @Published var trainings:[Training] = []
    
    @Published var simpleWorkout: Workouts!
    
    @Published var simleWorkOutTitle = ""
    @Published var simpleWorkoutTime = Date()
    @Published var simleTrainingDetails = ""
    @Published var simleTrainingExercise = ""
    
    @Published var isPresentWorkout = false
    @Published var isPresentAddTraining = false
    
    @Published var isNewWorkout = false
    @Published var isEditTtle = false
    
    init(){
        getTrainings()
        getWorkOuts()
    }
    
    //MARK: - Edit data
    func editWorkout(){
        let request = NSFetchRequest<Workouts>(entityName: "Workouts")
        
        do{
            workouts = try manager.context.fetch(request)
            let workout = workouts.first(where: {$0.id == simpleWorkout.id})
            workout?.time = simpleWorkoutTime
            workout?.title = simleWorkOutTitle
        }catch let error{
            print("Error fetching: \(error.localizedDescription)")
        }
        save()
    }
    
    //MARK: - Add data
    func addWorkout(){
        let newWorkout = Workouts(context: manager.context)
        newWorkout.title = simleWorkOutTitle
        newWorkout.time = simpleWorkoutTime
        simpleWorkout = newWorkout
        
        save()
        
    }
    
    func addTrainig(){
        let newTraining = Training(context: manager.context)
        newTraining.details = simleTrainingDetails
        newTraining.exercise = simleTrainingExercise
        newTraining.workouts = simpleWorkout
        
        save()
    }
    
    //MARK: - Get data
    func getWorkOuts(){
        let request = NSFetchRequest<Workouts>(entityName: "Workouts")
        
        do{
            workouts = try manager.context.fetch(request)
        }catch let error{
            print("Error fetching: \(error.localizedDescription)")
        }
    }
    
    func getTrainings(){
        let request = NSFetchRequest<Training>(entityName: "Training")
        
        do{
            trainings = try manager.context.fetch(request)
        }catch let error{
            print("Error fetching: \(error.localizedDescription)")
        }
    }
    
    //MARK: - Clear data
    func clear(){
        simleWorkOutTitle = ""
        simleTrainingDetails = ""
        simleTrainingExercise = ""
    }
    
    //MARK: - Save data
    func save(){
        workouts.removeAll()
        trainings.removeAll()
        manager.save()
        getTrainings()
        getWorkOuts()
    }
}
