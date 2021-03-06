//
//  ToDoDetailTableViewController.swift
//  toDoList1
//
//  Created by Lucas  Pomeroy  on 2/10/20.
//  Copyright © 2020 Lucas Pomeroy. All rights reserved.
//

import UIKit

private let dateFormatter: DateFormatter = {
    let dateFromatter = DateFormatter()
    dateFromatter.dateStyle = .short
    dateFromatter.timeStyle = .short
    return dateFromatter
}()

class ToDoDetailTableViewController: UITableViewController {


    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var datePicker: UIDatePicker!
   
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var noteView: UITextView!
    
    @IBOutlet weak var reminderSwitch: UISwitch!
    var toDoItem: ToDoItem!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    let datePickerIndexPath = IndexPath(row: 1, section: 1)
    let notesTextViewIndexPath = IndexPath(row: 0, section: 2)
    let notesRowHeight: CGFloat = 200
    let defaultRowHeight: CGFloat = 44
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if toDoItem == nil{
            toDoItem = ToDoItem(name: "", date: Date().addingTimeInterval(24*60*60), notes: "", reminderSet: false)
        }
       
      updateUserInterface()
    }
    
    func updateUserInterface() {
        nameField.text = toDoItem.name
               datePicker.date = toDoItem.date
               noteView.text = toDoItem.notes
               reminderSwitch.isOn = toDoItem.reminderSet
               dateLabel.textColor = (reminderSwitch.isOn ? .black : .gray)
        dateLabel.text = dateFormatter.string(from:toDoItem.date)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        toDoItem = ToDoItem(name: nameField.text! , date: datePicker.date, notes: noteView.text, reminderSet: reminderSwitch.isOn)
    }


    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        let isPresentingInAddMode = presentingViewController is UINavigationController
        if isPresentingInAddMode{
            dismiss(animated: true, completion: nil )
        } else {
            navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func reminderSwitchChanged(_ sender: UISwitch) {
         dateLabel.textColor = (reminderSwitch.isOn ? .black : .gray)
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    
    
    @IBAction func datePickerChanged(_ sender: UIDatePicker) {
        dateLabel.text = dateFormatter.string(from: sender.date )
    }
    
}

extension ToDoDetailTableViewController{
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath{
        case datePickerIndexPath:
            return reminderSwitch.isOn ? datePicker.frame.height : 0
        case notesTextViewIndexPath:
            return notesRowHeight
        default:
            return defaultRowHeight
        }
    }
}
