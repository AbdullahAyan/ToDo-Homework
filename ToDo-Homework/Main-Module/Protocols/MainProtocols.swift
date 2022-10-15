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
    
    func showTask()
    func deleteTask()
    func searchTask()
}

protocol PresenterToInteractorMainProtocol {
    var mainPresenter: InteractorToPresenterMainProtocol? {get set}
    
    func showTask()
    func deleteTask()
    func searchTask()
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

