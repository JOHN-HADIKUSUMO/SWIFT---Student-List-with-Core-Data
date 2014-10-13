//
//  Profile.swift
//  Student
//
//  Created by Gunawan Hadikusumo on 11/10/2014.
//  Copyright (c) 2014 Berguru.com. All rights reserved.
//

import Foundation
import CoreData

class Profile: NSManagedObject {

    @NSManaged var firstname: String
    @NSManaged var lastname: String
    @NSManaged var street1: String
    @NSManaged var street2: String

}
