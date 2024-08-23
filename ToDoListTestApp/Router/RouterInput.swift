//
//  RouterInput.swift
//  ToDoListTestApp
//
//  Created by Максим Тарасов on 23.08.2024.
//

import Foundation

protocol RouterInput: AnyObject {
    func showAddAlert()
    func showInfoVC(element: ToDoElement)
}
