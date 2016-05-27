//
//  Employ+CoreDataProperties.swift
//  SeatAllocation
//
//  Created by Hari Kishore on 5/27/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Employ {

    @NSManaged var firstName: String?
    @NSManaged var lastName: String?
    @NSManaged var employId: String?
    @NSManaged var indexPath: String?
    @NSManaged var odcNumber: NSNumber?
    @NSManaged var odc: NSManagedObject?

}
