//
//  NewODCViewController.swift
//  SeatAllocation
//
//  Created by Hari Kishore on 5/27/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

import UIKit
import CoreData

class NewODCViewController: UIViewController {

    @IBOutlet weak var odcNameText: UITextField!
    @IBOutlet weak var numberOfRows: UITextField!
    @IBOutlet weak var numberOfColumns: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func NewOdcCancelAction(sender: AnyObject) {
         self.dismissViewControllerAnimated(true, completion: {})
    }
    
    @IBAction func newOdcSaveAction(sender: AnyObject) {
//        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
//        let managedObjectCotext = appDelegate.managedObjectContext
//        let entityDescription = NSEntityDescription.entityForName("Odc", inManagedObjectContext:managedObjectCotext)
//        let newOdc = NSManagedObject(entity: entityDescription!, insertIntoManagedObjectContext:managedObjectCotext)
//        
//        newOdc.setValue("ODC-1", forKey: "odcName")
//        newOdc.setValue(3, forKey: "rows")
//        newOdc.setValue(4, forKey: "columns")
        
        //let odc : Odc = Odc()
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedObjectCotext = appDelegate.managedObjectContext
        let entityDescription = NSEntityDescription.entityForName("Odc", inManagedObjectContext:managedObjectCotext)
        let odc : Odc = Odc.init(entity: entityDescription!, insertIntoManagedObjectContext: managedObjectCotext)
        
        odc.odcName = "odc-2"
        odc.rows = 2
        odc.columns = 4
        
        do {
            try odc.managedObjectContext?.save()
        } catch {
            print(error)
        }
    }
}
