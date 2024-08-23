//
//  ToDoModel.swift
//  ToDoListTestApp
//
//  Created by Максим Тарасов on 23.08.2024.
//

import Foundation

struct TodoModel: Codable {
    var todos: [ToDoElement]
}

struct ToDoElement: Codable {
    var id: Int
    var todo: String
    var completed: Bool
}
