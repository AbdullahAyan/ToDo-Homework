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
    
    func showTask() {
        mainInteractor?.showTask()
    }
    
    func deleteTask() {
        mainInteractor?.deleteTask()
    }
    
    func searchTask() {
        mainInteractor?.searchTask()
    }
    
    
}

extension MainPresenter: InteractorToPresenterMainProtocol {
    func sendDataToPresenter(tasks: Array<String>) {
        mainView?.sendDataToView(tasks: tasks)
    }
        
}
                     

