//
//  DetailRouter.swift
//  ToDo-Homework
//
//  Created by Abdullah Ayan on 15.10.2022.
//

import Foundation

class DetailRouter: PresenterToRouterDetailProtocol {
    static func createModule(viewController: DetailViewController) {
        let presenter = DetailPresenter()
        
//        View
        viewController.presenter = presenter
        
//        Detail
        presenter.detailInteractor = DetailInteractor()
        
    }
}
