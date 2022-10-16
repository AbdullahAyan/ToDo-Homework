//
//  MainInteractor.swift
//  ToDo-Homework
//
//  Created by Abdullah Ayan on 15.10.2022.
//

import Foundation

class MainInteractor: PresenterToInteractorMainProtocol {
    var mainPresenter: InteractorToPresenterMainProtocol?
    
    var tasks = ["Homework","Exercise"]
    
    func showTasks() {
        mainPresenter?.sendDataToPresenter(tasks: tasks)
    }
    
    func deleteTask() {
        
    }
    
    func searchTask(searchText: String) {
        
        for task in tasks {
            if task.lowercased().contains(searchText.lowercased()) {
                tasks.append(task)
            }
        }
        
    }
    
    
    
    
}
