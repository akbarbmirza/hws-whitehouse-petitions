//
//  ViewController.swift
//  Whitehouse Petitions
//
//  Created by Akbar Mirza on 6/14/17.
//  Copyright © 2017 Akbar Mirza. All rights reserved.
//

import UIKit
import SwiftyJSON // to handle JSON

class ViewController: UITableViewController {
    
    // =========================================================================
    // Outlets
    // =========================================================================
    
    // =========================================================================
    // Properties
    // =========================================================================
    
    // create a variable to hold our petitions
    var petitions = [[String: String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let urlString = "https://api.whitehouse.gov/v1/petitions.json?limit=100"
        
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                let json = JSON(data: data)
                
                // if our response code is 200 (i.e. everything is normal)
                if json["metadata"]["responseInfo"]["status"].intValue == 200 {
                    // we're OK to parse!
                    parse(json: json)
                }
            }
        }
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
        
        // get the petition data for this cell
        let petition = petitions[indexPath.row]
        
        // set the labels in our cell
        cell.textLabel?.text = petition["title"]
        cell.detailTextLabel?.text = petition["body"]
        
        // return our cell
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.detailItem = petitions[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
    // =========================================================================
    // Helper Methods
    // =========================================================================
    
    // reads the "results" array from the JSON object it gets passed and adds it
    // to our petitions property
    func parse(json: JSON) {
        // get our json array
        for result in json["results"].arrayValue {
            // store the title, body, and sigs in a dictionary that we can use
            let title = result["title"].stringValue
            let body = result["body"].stringValue
            let sigs = result["signatureCount"].stringValue
            let obj = [
                "title": title,
                "body": body,
                "sigs": sigs
            ]
            // append that dictionary to our petitions object
            petitions.append(obj)
        }
        
        // reload our tableview
        tableView.reloadData()
    }

}

