//
//  StudentListController.swift
//  Student
//
//  Created by Gunawan Hadikusumo on 10/10/2014.
//  Copyright (c) 2014 Berguru.com. All rights reserved.
//

import UIKit
import CoreData

class StudentListController: UIViewController,UITableViewDelegate,NSFetchedResultsControllerDelegate  {
    let managedObjectContext = (UIApplication.sharedApplication().delegate as AppDelegate).managedObjectContext
    
    var fetchedResultController: NSFetchedResultsController = NSFetchedResultsController()
    
    @IBOutlet var studentlist: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchedResultController = getFetchedResultController()
        fetchedResultController.delegate = self
        fetchedResultController.performFetch(nil)

    }
    
    func getFetchedResultController() -> NSFetchedResultsController {
        fetchedResultController = NSFetchedResultsController(fetchRequest: taskFetchRequest(), managedObjectContext: managedObjectContext!, sectionNameKeyPath: nil, cacheName: nil)
        return fetchedResultController
    }
    
    func taskFetchRequest() -> NSFetchRequest {
        let fetchRequest = NSFetchRequest(entityName: "Profile")
        let sortDescriptor = NSSortDescriptor(key: "firstname", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        return fetchRequest
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        let numberOfRowsInSection = fetchedResultController.sections?[section].numberOfObjects
        return numberOfRowsInSection!
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier("row", forIndexPath: indexPath) as UITableViewCell
        
        var student:Profile? = fetchedResultController.objectAtIndexPath(indexPath) as? Profile
        
        var lblfullname = cell.contentView.subviews[0] as UILabel
        var fullname: String = student!.firstname + " " + student!.lastname
        lblfullname.text = fullname
        
        var lblstreet1 = cell.contentView.subviews[1] as UILabel
        lblstreet1.text = student!.street1
        
        var lblstreet2 = cell.contentView.subviews[2] as UILabel
        lblstreet2.text = student!.street2
        
        return cell
    }
    
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int{
        let numberOfSections = fetchedResultController.sections?.count
        //return numberOfSections!
        return 1
    }
    
    
    func controllerDidChangeContent(controller: NSFetchedResultsController!) {
        studentlist.reloadData()
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {

    }


}
