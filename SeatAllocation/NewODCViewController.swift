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
        
        //let odc = managedObjectCotext.insert(Odc)
        
        odc.odcName = self.odcNameText.text!
        odc.rows = Int(self.numberOfRows.text!)
        odc.columns = Int(self.numberOfColumns.text!)
        
        //let dataDict : NSMutableDictionary = NSMutableDictionary()
        //dataDict.setValue(self.odcNameText.text!, forKey: "odcName")
        //dataDict.setValue(Int(self.numberOfRows.text!), forKey: "rows")
        //dataDict.setValue(Int(self.numberOfColumns.text!), forKey: "columns")
        
        do {
            try odc.managedObjectContext?.save()
            self.odcNameText.text = ""
            self.numberOfRows.text = ""
            self.numberOfColumns.text = ""
            let alertController = UIAlertController(title: "Success", message: "Insert Success!", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: .Default, handler: { (action: UIAlertAction!) in
                print("Handle Ok logic here")
            }))
            
            self.presentViewController(alertController, animated: true, completion: nil)
        } catch {
            //var alert = (title: "Error", message: error, delegate: nil, cancelButtonTitle: "Ok")
            let alertController = UIAlertController(title: "Error", message: String(error), preferredStyle: UIAlertControllerStyle.Alert)
            self.presentViewController(alertController, animated: true, completion: nil)
            print(error)
        }
    }
}
