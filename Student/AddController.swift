//
//  AddController.swift
//  Student
//
//  Created by Gunawan Hadikusumo on 10/10/2014.
//  Copyright (c) 2014 Berguru.com. All rights reserved.
//

import UIKit
import CoreData

class AddController: UIViewController {
    let managedObjectContext = (UIApplication.sharedApplication().delegate as AppDelegate).managedObjectContext
    
    @IBOutlet var firstname: UITextField!
    
    @IBOutlet var lastname: UITextField!
    
    @IBOutlet var street1: UITextField!
    
    @IBOutlet var street2: UITextField!
    
    @IBAction func save(sender: AnyObject) {
        let entityDescripition = NSEntityDescription.entityForName("Profile", inManagedObjectContext: managedObjectContext!)
        let profile = Profile(entity: entityDescripition!, insertIntoManagedObjectContext: managedObjectContext)
        profile.firstname = firstname.text
        profile.lastname = lastname.text
        profile.street1 = street1.text
        profile.street2 = street2.text
        managedObjectContext?.save(nil)
        
        navigationController?.popViewControllerAnimated(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    /*
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {

    }
     */

}
