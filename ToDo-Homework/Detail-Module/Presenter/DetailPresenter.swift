//
//  DetailPresenter.swift
//  ToDo-Homework
//
//  Created by Abdullah Ayan on 15.10.2022.
//

import Foundation

class DetailPresenter: ViewToPresenterDetailProtocol {
    var detailView: DetailViewController?
    
    var detailInteractor: PresenterToInteractorDetailProtocol?
    
    func updateTask(task: String) {
        detailInteractor?.updateTask(task: task)
    }
    
    
}
