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
    
    func deleteTask(yapilacak_id: String) {
        mainInteractor?.deleteTask(yapilacak_id: yapilacak_id)
    }
    
    func searchTask(searchText: String) {
        mainInteractor?.searchTask(searchText: searchText)
    }
    
    
}

extension MainPresenter: InteractorToPresenterMainProtocol {
    func sendDataToPresenter(tasks: Array<Task>) {
        mainView?.sendDataToView(tasks: tasks)
    }
        
}
                     

