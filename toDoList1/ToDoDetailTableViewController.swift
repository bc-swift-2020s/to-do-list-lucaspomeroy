//
//  ToDoDetailTableViewController.swift
//  toDoList1
//
//  Created by Lucas  Pomeroy  on 2/10/20.
//  Copyright © 2020 Lucas Pomeroy. All rights reserved.
//

import UIKit

class ToDoDetailTableViewController: UITableViewController {


    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var nameField: UITextView!
    @IBOutlet weak var notesField: UITextView!
    
    var toDoItem: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.text = toDoItem
        

       
    }


    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        let isPresentingInAddMode = presentingViewController is UINavigationController
        if isPresentingInAddMode{
            dismiss(animated: true, completion: nil )
        } else {
            navigationController?.popViewController(animated: true)
        }
    }
    
}
