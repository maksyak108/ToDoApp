//
//  ToDoDetailPresenter.swift
//  ToDoListTestApp
//
//  Created by Максим Тарасов on 23.08.2024.
//

import Foundation

class ToDoDetailPresenter: DetailViewOutput, DetailInteractorOutput {

    weak var view: ToDoDetailViewController!
    var interactor: DetailInteractorInput!
    var router: DetailRouterInput!

    func updateToDoItem(element: ToDoElement) {
        interactor.updateToDoItem(element: element)
    }
}
