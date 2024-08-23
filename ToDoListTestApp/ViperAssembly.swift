//
//  ViperAssembly.swift
//  ToDoListTestApp
//
//  Created by Максим Тарасов on 23.08.2024.
//

import Foundation
import UIKit

class ViperAssembly {
    
    class func configureModule() -> UIViewController {
        
        let view = ToDoListViewController()
        let presenter = ViperPresenter()
        let interactor = Interactor()
        let router = Router()
        let coreDataManager = CoreDataManager()
        
        view.output = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.output = presenter
        interactor.coreDataManager = coreDataManager
        router.view = view
        
        return view
    }
    
    class func configureInfoModule(with element: ToDoElement) -> UIViewController {
        let view = ToDoDetailViewController()
        let presenter = ToDoDetailPresenter()
        let interactor = ToDoDetailInteractor()
        let router = ToDoDetailRouter()
        let coreDataManager = CoreDataManager()
        
        view.output = presenter
        view.todoItem = element
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.output = presenter
        interactor.coreDataManager = coreDataManager
        router.view = view

        return view
    }
}
