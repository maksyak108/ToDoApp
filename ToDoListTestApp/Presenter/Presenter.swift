//
//  Presenter.swift
//  ToDoListTestApp
//
//  Created by Максим Тарасов on 23.08.2024.
//

import Foundation

class ViperPresenter: ViewOutput, InteractorOutput {
    
    weak var view: ToDoListViewController!
    var interactor: InteractorInput!
    var router: RouterInput!
    
    func didFetchToDoModels(_ items: [ToDoElement]) {
        view.update(with: items)
    }
    
    func didFailToFetchToDoModels(with error: Error) {
        print(error.localizedDescription)
    }
    
    func fetchData() {
        interactor.fetchToDoModels()
    }
    
    func deleteToDoElement(toDoElement: ToDoElement) {
        interactor.deleteToDoElement(toDoElement: toDoElement)
    }
    
    func didTapAddButton() {
        router.showAddAlert()
    }
    
    func addNewToDo(text: String) {
        interactor.saveToDoElement(todo: text)
    }
    
    func showDetails(element: ToDoElement) {
        router.showInfoVC(element: element)
    }
}
