//
//  MainRouter.swift
//  ToDo-Homework
//
//  Created by Abdullah Ayan on 15.10.2022.
//

import Foundation

class MainRouter: PresenterToRouterMainProtocol {
    static func createModule(viewController: MainViewController) {
        let presenter = MainPresenter()
        
//        View
        viewController.mainPresenter = presenter
        
//        Presenter
        presenter.mainInteractor = MainInteractor()
        presenter.mainView = viewController
        
//        Interactor
        presenter.mainInteractor?.mainPresenter = presenter
    }
    
    
}
