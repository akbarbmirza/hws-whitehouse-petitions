//
//  ViewController.swift
//  Whitehouse Petitions
//
//  Created by Akbar Mirza on 6/14/17.
//  Copyright © 2017 Akbar Mirza. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    // =========================================================================
    // Outlets
    // =========================================================================
    
    // =========================================================================
    // Properties
    // =========================================================================
    
    // create a variable to hold our petitions
    var petitions = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // =========================================================================
    // TableView Methods
    // =========================================================================
    
    // tells us how many rows will be in our view
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return petitions.count
    }
    
    // tells iOS how to set up each individual cell in our table
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // dequeue the cell in our storyboard
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        // set the labels in our cell
        cell.textLabel?.text = "Title Goes Here"
        cell.detailTextLabel?.text = "Subtitle Goes Here"
        
        // return our cell
        return cell
    }

}

