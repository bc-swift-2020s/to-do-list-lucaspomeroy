//
//  ViewController.swift
//  toDoList1
//
//  Created by Lucas  Pomeroy  on 2/10/20.
//  Copyright © 2020 Lucas Pomeroy. All rights reserved.
//

import UIKit

class toDoListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var toDoArray = ["You are Awesome!", "Build Apps!", "Learn Swift.", "Take a vacation!"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }


}

extension toDoListViewController: UITableViewDelegate ,UITableViewDataSource{
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return toDoArray.count
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    cell.textLabel?.text = toDoArray[indexPath.row]
    return cell
}
}


