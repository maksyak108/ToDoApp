//
//  InteractorInput.swift
//  ToDoListTestApp
//
//  Created by Максим Тарасов on 23.08.2024.
//

import Foundation

protocol InteractorInput: AnyObject {
    func fetchToDoModels()
    func saveToDoElement(todo: String)
    func deleteToDoElement(toDoElement: ToDoElement)
}
