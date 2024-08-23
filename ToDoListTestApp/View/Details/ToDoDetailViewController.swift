//
//  ToDoDetailViewController.swift
//  ToDoListTestApp
//
//  Created by Максим Тарасов on 23.08.2024.
//

import UIKit

class ToDoDetailViewController: UIViewController, DetailViewInput {

    var output: DetailViewOutput!
    var todoItem: ToDoElement!

    private let todoTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.font = UIFont.systemFont(ofSize: 18)
        textView.isScrollEnabled = false
        return textView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemGroupedBackground
        
        setupUI()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        todoItem.todo = todoTextView.text ?? ""
        output.updateToDoItem(element: todoItem)
    }

    private func setupUI() {
        updateCompletedButton()
        todoTextView.text = todoItem.todo
        view.addSubview(todoTextView)

        NSLayoutConstraint.activate([
            todoTextView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            todoTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            todoTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            todoTextView.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
    
    private func updateCompletedButton() {
        let iconName = todoItem?.completed == true ? "checkmark.circle" : "circle"
        let buttonImage = UIImage(systemName: iconName)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: buttonImage, style: .plain, target: self, action: #selector(didTapCompletedButton))
        navigationItem.title = "ToDoDetail"
    }

    @objc func didTapCompletedButton() {
        todoItem.completed.toggle()
        updateCompletedButton()
    }
    
}
