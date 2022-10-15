//
//  MainInteractor.swift
//  ToDo-Homework
//
//  Created by Abdullah Ayan on 15.10.2022.
//

import Foundation

class MainInteractor: PresenterToInteractorMainProtocol {
    var mainPresenter: InteractorToPresenterMainProtocol?
    
    func showTask() {
        mainPresenter?.sendDataToPresenter(tasks: ["Homework","Exercise"])
    }
    
    func deleteTask() {
        
    }
    
    func searchTask() {
        
    }
    
    
}
