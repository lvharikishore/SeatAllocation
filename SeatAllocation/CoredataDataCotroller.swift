//
//  CoredataDataCotroller.swift
//  SeatAllocation
//
//  Created by Hari Kishore on 5/30/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

import UIKit
import CoreData

extension NSManagedObject {
    
    public class var entityName : String {
        let components = NSStringFromClass(self).componentsSeparatedByString(".")
        return components[1]
    }
}

extension NSManagedObjectContext {
    
    func insert<T:NSManagedObject>(entity:T.Type) -> T {
        let entityName = entity.entityName
        return NSEntityDescription.insertNewObjectForEntityForName(entityName, inManagedObjectContext: self) as! T
    }
}

//class CoredataDataCotroller: NSObject {
//    let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
//        
//    func insert(entityName:String, data dataDictionary:NSDictionary, entityClass:NSManagedObject) -> Bool {
//        let model = managedObjectContext.insert(entityName)
//        return true
//    }
//
//}
