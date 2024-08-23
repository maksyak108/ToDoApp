//
//  InteractorOutput.swift
//  ToDoListTestApp
//
//  Created by Максим Тарасов on 23.08.2024.
//

import Foundation

protocol InteractorOutput: AnyObject {
    func didFetchToDoModels(_ items: [ToDoElement])
    func didFailToFetchToDoModels(with error: Error)
}
