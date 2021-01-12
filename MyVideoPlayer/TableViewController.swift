//
//  TableViewController.swift
//  TableRefreshControl
//
//  Created by Domo on 28/08/2019.
//  Copyright © 2019 Domenico Nicoli. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var numbersElements = [String]()
    var topView: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // preloaded elements
        numbersElements.append("The number is 0")
        numbersElements.append("The number is 1")
        numbersElements.append("The number is 2")
        
    }
    
    @IBAction func refreshControlValueChanged(_ sender: UIRefreshControl) {
        let elementsCount = numbersElements.count
        numbersElements.append(String(elementsCount + 1))
        tableView.reloadData()
        sender.endRefreshing()
    }

    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numbersElements.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let foodElement = numbersElements[indexPath.row]
        
        cell.textLabel?.text = foodElement
        
        return cell
    }

}
