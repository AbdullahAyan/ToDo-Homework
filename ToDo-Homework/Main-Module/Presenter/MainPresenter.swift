//
//  MainPresenter.swift
//  ToDo-Homework
//
//  Created by Abdullah Ayan on 15.10.2022.
//

import Foundation



class MainPresenter: ViewToPresenterMainProtocol {
    var mainView: PresenterToViewMainProtocol?
    var mainInteractor: PresenterToInteractorMainProtocol?
    
    func showTasks() {
        mainInteractor?.showTasks()
    }
    
    func deleteTask() {
        mainInteractor?.deleteTask()
    }
    
    func searchTask(searchText: String) {
        mainInteractor?.searchTask(searchText: searchText)
    }
    
    
}

extension MainPresenter: InteractorToPresenterMainProtocol {
    func sendDataToPresenter(tasks: Array<String>) {
        mainView?.sendDataToView(tasks: tasks)
    }
        
}
                     

