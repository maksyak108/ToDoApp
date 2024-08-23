//
//  Interactor.swift
//  ToDoListTestApp
//
//  Created by Максим Тарасов on 23.08.2024.
//

import Foundation

class Interactor: InteractorInput {
    
    weak var output: InteractorOutput!
    var coreDataManager: CoreDataManager!
    
    func fetchToDoModels() {
        if coreDataManager.isCoreDataEmpty() {
            DispatchQueue.global(qos: .userInitiated).async { [weak self] in
                let url = URL(string: "https://dummyjson.com/todos")!
            
                do {
                    let data = try Data(contentsOf: url)
                    let items = try JSONDecoder().decode(TodoModel.self, from: data)
                
                    self?.coreDataManager.saveToCoreData(items.todos)
                
                    DispatchQueue.main.async {
                        self?.output?.didFetchToDoModels(items.todos)
                    }
                } catch {
                    DispatchQueue.main.async {
                        self?.output?.didFailToFetchToDoModels(with: error)
                    }
                }
            }
        } else {
            let items = coreDataManager.loadFromCoreData()
            DispatchQueue.main.async { [weak self] in
                self?.output?.didFetchToDoModels(items)
            }
        }
    }
    
    func saveToDoElement(todo: String) {
        coreDataManager.saveToDoElement(todo: todo)
        self.fetchToDoModels()
    }
    
    func deleteToDoElement(toDoElement: ToDoElement) {
        coreDataManager.deleteToDoElement(toDoElement: toDoElement)
        self.fetchToDoModels()
    }
}

