//
//  AddRouter.swift
//  ToDo-Homework
//
//  Created by Abdullah Ayan on 15.10.2022.
//

import Foundation

class AddRouter: PresenterToRouterAddProtocol {
    static func createModule(viewController: AddViewController) {
        let presenter = AddPresenter()
        
//        View
        viewController.addPresenter = presenter
        
//        Presenter
        presenter.addInteractor = AddInteractor()
        
    }
}
