//
//  ViewController.swift
//  ShoppingListApp
//
//  Created by Aiman Abdullah Anees on 21/05/16.
//  Copyright © 2016 Aiman Abdullah Anees. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    var items = [String]()
    @IBOutlet var TextBox: UITextField!
    
    
    @IBOutlet var TableView: UITableView!
    
    
    
    
    @IBAction func Button(sender: AnyObject) {
        var NewItem = TextBox.text!
        var trimmed = NewItem.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        
        
        if ( trimmed != "")
        {   items.append(trimmed)
            TextBox.resignFirstResponder()
            TextBox.text = ""
            TableView.reloadData()
        }
        
            
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        cell.textLabel!.text = items[indexPath.row]
        cell.textLabel?.textColor = UIColor.redColor()
        
        return cell
        
        
        

    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let selectedRow = tableView.cellForRowAtIndexPath(indexPath)!
        
        if (selectedRow.accessoryType == UITableViewCellAccessoryType.None)
        {
            selectedRow.accessoryType = UITableViewCellAccessoryType.Checkmark
            selectedRow.tintColor = UIColor.greenColor()
            
        }
        
        else{
            selectedRow.accessoryType = UITableViewCellAccessoryType.None
        }
        
     
        
    }
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
        let deletedRow = tableView.cellForRowAtIndexPath(indexPath)!
        
        if (editingStyle == UITableViewCellEditingStyle.Delete)
        {
            items.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
            deletedRow.accessoryType = UITableViewCellAccessoryType.None
            
            
            
        }
        
    }
    
}

