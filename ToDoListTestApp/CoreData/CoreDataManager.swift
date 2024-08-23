//
//  CoreDataManager.swift
//  ToDoListTestApp
//
//  Created by Максим Тарасов on 23.08.2024.
//

import Foundation
import CoreData
import UIKit

class CoreDataManager {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func saveToDoElement(todo: String) {
        
        let newTodo = ToDoCoreData(context: context)
        newTodo.id = Int16.random(in: 1...Int16.max)
        newTodo.todo = todo
        newTodo.completed = false
        
        do {
            try context.save()
        } catch {
            print("\(error.localizedDescription)")
        }
    
    }
    
    func deleteToDoElement(toDoElement: ToDoElement) {
       
        let fetchRequest: NSFetchRequest<ToDoCoreData> = ToDoCoreData.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %d", toDoElement.id)
        
        do {
            let results = try context.fetch(fetchRequest)
            if let entityToDelete = results.first {
                context.delete(entityToDelete)
                try context.save()
            }
        } catch {
            print("\(error.localizedDescription)")
        }
    }
    
    func loadFromCoreData() -> [ToDoElement] {
    
        let fetchRequest: NSFetchRequest<ToDoCoreData> = ToDoCoreData.fetchRequest()
        
        do {
            let results = try context.fetch(fetchRequest)
            let todos = results.map { ToDoElement(id: Int($0.id), todo: $0.todo ?? "", completed: $0.completed) }
            return todos
        } catch {
            print("\(error.localizedDescription)")
            return []
        }
    }
    
    func isCoreDataEmpty() -> Bool {
        
        let fetchRequest: NSFetchRequest<ToDoCoreData> = ToDoCoreData.fetchRequest()
        
        do {
            let count = try context.count(for: fetchRequest)
            return count == 0
        } catch {
            print("\(error.localizedDescription)")
            return true
        }
    }

    
    func saveToCoreData(_ todos: [ToDoElement]) {
        
        todos.forEach { todo in
            let fetchRequest: NSFetchRequest<ToDoCoreData> = ToDoCoreData.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "id == %d", todo.id)
            
            do {
                let results = try context.fetch(fetchRequest)
                if let existingToDo = results.first {
                    
                    existingToDo.todo = todo.todo
                    existingToDo.completed = todo.completed
                } else {
                    
                    let newToDo = ToDoCoreData(context: context)
                    newToDo.id = Int16(todo.id)
                    newToDo.todo = todo.todo
                    newToDo.completed = todo.completed
                }
                try context.save()
            } catch {
                print("\(error.localizedDescription)")
            }
        }
    }
    
    func updateToDoItem(element: ToDoElement) {
        
        let fetchRequest: NSFetchRequest<ToDoCoreData> = ToDoCoreData.fetchRequest()
        if element.todo == "" {
            deleteToDoElement(toDoElement: element)
        } else {
            fetchRequest.predicate = NSPredicate(format: "id == %d", element.id)
            
            do {
                let results = try context.fetch(fetchRequest)
                
                if let toDoEntity = results.first {
                    toDoEntity.todo = element.todo
                    toDoEntity.completed = element.completed
                    
                    try context.save()
                }
            } catch {
                print("\(error.localizedDescription)")
            }
        }
    }
}
