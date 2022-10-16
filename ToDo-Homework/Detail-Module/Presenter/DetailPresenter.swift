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
    
    func updateTask(yapilacak_id: String,yapilacak_is: String) {
        detailInteractor?.updateTask(yapilacak_id: yapilacak_id,yapilacak_is: yapilacak_is)
    }
    
    
}
