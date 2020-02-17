//
//  ToDoItem.swift
//  toDoList1
//
//  Created by Lucas  Pomeroy  on 2/11/20.
//  Copyright © 2020 Lucas Pomeroy. All rights reserved.
//

import Foundation

struct ToDoItem: Codable{
       var name: String
       var date: Date
       var notes: String
       var reminderSet: Bool
       
   }
