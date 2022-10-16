//
//  MainProtocols.swift
//  ToDo-Homework
//
//  Created by Abdullah Ayan on 15.10.2022.
//

import Foundation


//MARK: - Main Protocols
protocol ViewToPresenterMainProtocol {
    var mainView: PresenterToViewMainProtocol? {get set}
    var mainInteractor: PresenterToInteractorMainProtocol? {get set}
    
    func showTasks()
    func deleteTask()
    func searchTask(searchText: String)
}

protocol PresenterToInteractorMainProtocol {
    var mainPresenter: InteractorToPresenterMainProtocol? {get set}
    
    func showTasks()
    func deleteTask()
    func searchTask(searchText: String)
}



//MARK: - Transporter Protocols
protocol InteractorToPresenterMainProtocol {
    func sendDataToPresenter(tasks: Array<String>)
}

protocol PresenterToViewMainProtocol {
    func sendDataToView(tasks: Array<String>)
}




//MARK: - Router Protocol
protocol PresenterToRouterMainProtocol {
    static func createModule(viewController: MainViewController)
}

