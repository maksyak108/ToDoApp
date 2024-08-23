//
//  ViewInput.swift
//  ToDoListTestApp
//
//  Created by Максим Тарасов on 23.08.2024.
//

import Foundation

protocol ViewInput: AnyObject {
    func update(with viewModels: [ToDoElement])
    func showAddAlert()
}

