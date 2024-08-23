//
//  ToDoDetailInteractor.swift
//  ToDoListTestApp
//
//  Created by Максим Тарасов on 23.08.2024.
//

import Foundation

class ToDoDetailInteractor: DetailInteractorInput {
    
    weak var output: DetailInteractorOutput!
    var coreDataManager: CoreDataManager!
    
    func updateToDoItem(element: ToDoElement) {
        coreDataManager.updateToDoItem(element: element)
    }
}
