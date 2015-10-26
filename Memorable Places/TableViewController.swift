//
//  TableViewController.swift
//  Memorable Places
//
//  Created by Rob Percival on 13/03/2015.
//  Copyright (c) 2015 Appfish. All rights reserved.
//

import UIKit

var places = [Dictionary<String,String>()]

var activePlace = -1

class TableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        if places.count == 1 {
            
            places.removeAtIndex(0)
            
            places.append(["name":"Taj Mahal","lat":"27.175277","lon":"78.042128"])
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.

        return places.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell

        
        cell.textLabel?.text =  places[indexPath.row]["name"]

        return cell
    }
    
    override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        
        activePlace = indexPath.row
        
        return indexPath
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "newPlace" {
            
            activePlace = -1
            
        }
        
    }
    
    
    
    override func viewWillAppear(animated: Bool) {
        
        tableView.reloadData()
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    


}
