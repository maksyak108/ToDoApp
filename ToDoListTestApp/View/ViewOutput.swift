//
//  ViewOutput.swift
//  ToDoListTestApp
//
//  Created by Максим Тарасов on 23.08.2024.
//

import Foundation

protocol ViewOutput: AnyObject {
    func fetchData()
    func didTapAddButton()
    func addNewToDo(text: String)
    func showDetails(element: ToDoElement)
    func deleteToDoElement(toDoElement: ToDoElement)
}
