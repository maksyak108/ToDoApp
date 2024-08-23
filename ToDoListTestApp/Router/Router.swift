//
//  Router.swift
//  ToDoListTestApp
//
//  Created by Максим Тарасов on 23.08.2024.
//

import Foundation
import UIKit

class Router: RouterInput {
    
    weak var view: UIViewController!
    
    func showAddAlert() {
        (view as? ViewInput)?.showAddAlert()
    }
    
    func showInfoVC(element: ToDoElement) {
        let detailViewController = ViperAssembly.configureInfoModule(with: element)
        view?.navigationController?.pushViewController(detailViewController, animated: true)
    }
}

