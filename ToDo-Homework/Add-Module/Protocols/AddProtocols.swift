//
//  AddProtocols.swift
//  ToDo-Homework
//
//  Created by Abdullah Ayan on 15.10.2022.
//

import Foundation

//MARK: - Add Protocols
protocol ViewToPresenterAddProtocol {
    var addView: AddViewController? {get set}
    var addInteractor: PresenterToInteractorAddProtocol? {get set}
    
    func addTask(yapilacak_is: String)
}

protocol PresenterToInteractorAddProtocol {
    
    func addTask(yapilacak_is: String)
}





//MARK: - Router Protocol
protocol PresenterToRouterAddProtocol {
    static func createModule(viewController: AddViewController)
}

