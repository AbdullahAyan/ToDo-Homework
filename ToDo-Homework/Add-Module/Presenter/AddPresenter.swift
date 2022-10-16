//
//  AddPresenter.swift
//  ToDo-Homework
//
//  Created by Abdullah Ayan on 15.10.2022.
//

import Foundation

class AddPresenter:ViewToPresenterAddProtocol {
    var addView: AddViewController?
    
    var addInteractor: PresenterToInteractorAddProtocol?
    
    func addTask(yapilacak_is: String) {
        addInteractor?.addTask(yapilacak_is: yapilacak_is)
    }
    
    
}
