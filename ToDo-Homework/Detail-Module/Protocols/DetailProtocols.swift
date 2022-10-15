//
//  DetailProtocols.swift
//  ToDo-Homework
//
//  Created by Abdullah Ayan on 15.10.2022.
//

import Foundation

//MARK: - Detail Protocols
protocol ViewToPresenterDetailProtocol {
    var detailView: DetailViewController? {get set}
    var detailInteractor: PresenterToInteractorDetailProtocol? {get set}
    
    func updateTask(task: String)
}

protocol PresenterToInteractorDetailProtocol {
    
    func updateTask(task: String)
}





//MARK: - Router Protocol
protocol PresenterToRouterDetailProtocol {
    static func createModule(viewController: DetailViewController)
}

