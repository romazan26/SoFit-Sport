//
//  GoalViewModal.swift
//  SoFit Sport
//
//  Created by Роман on 23.08.2024.
//

import Foundation
import CoreData

final class GoalViewModal: ObservableObject{
    
    let manager = CoreDataManager.instance
    
    @Published var goals:[Goal] = []
    @Published var completedGoal:[Goal] = []
    @Published var noCompletedGoal:[Goal] = []
    
    @Published var simpleTitle = ""
    @Published var simpleExercise = ""
    
    @Published var isPresentAddGoal = false
    
    init(){
        getGoal()
        sortedGoals()
    }
    
    //MARK: - Sorted goals
    func sortedGoals(){
        completedGoal.removeAll()
        noCompletedGoal.removeAll()
        for goal in goals {
            if goal.comleted{
                completedGoal.append(goal)
            }else{
                noCompletedGoal.append(goal)
            }
        }
    }
    
    //MARK: - Edit data
    func comletedGoal(gola: Goal){
        let request = NSFetchRequest<Goal>(entityName: "Goal")
        
        do {
            goals = try manager.context.fetch(request)
            let goal = goals.first(where: {$0.id == gola.id})
            goal?.comleted = true
        }catch let error{
            print("Error fetching: \(error.localizedDescription)")
        }
        save()
        sortedGoals()
    }
    
    //MARK: - Add data
    func addGoal(){
        let newGoal = Goal(context: manager.context)
        newGoal.title = simpleTitle
        newGoal.exercise = simpleExercise
        
        save()
        clear()
        sortedGoals()
        
        isPresentAddGoal = false
    }
    
    //MARK: - Get data
    func getGoal(){
        let request = NSFetchRequest<Goal>(entityName: "Goal")
        
        do {
            goals = try manager.context.fetch(request)
        }catch let error{
            print("Error fetching: \(error.localizedDescription)")
        }
    }
    
    //MARK: - Save data
    func save(){
        goals.removeAll()
        manager.save()
        getGoal()
    }
    
    //MARK: - Clear data
    func clear(){
        simpleTitle = ""
        simpleExercise = ""
    }
}
