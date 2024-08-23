//
//  DetailViewOutput.swift
//  ToDoListTestApp
//
//  Created by Максим Тарасов on 23.08.2024.
//

import Foundation

protocol DetailViewOutput: AnyObject {
    func updateToDoItem(element: ToDoElement)
}
