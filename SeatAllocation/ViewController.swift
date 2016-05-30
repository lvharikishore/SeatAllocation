//
//  ViewController.swift
//  SeatAllocation
//
//  Created by Hari Kishore on 5/26/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UIGestureRecognizerDelegate, NSFetchedResultsControllerDelegate {

    @IBOutlet weak var listTableView: UITableView!
    @IBOutlet weak var topHeaderView: UIView!
    @IBOutlet var parentView: UIView!
    @IBOutlet weak var detailView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var odcRows = 4
    var odcColumns = 6
    
    var rowsArray = [10, 5 , 15 , 3]
    var columnsArray = [10, 2, 3, 20]

    var odcList = ["test1", "test2", "test3", "test4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        do {
            try self.fetchedResultsController.performFetch()
        } catch {
            let fetchError = error as NSError
            print("\(fetchError), \(fetchError.userInfo)")
        }
//
        
        
        let layout : MultpleLineFlowLayout = MultpleLineFlowLayout.init()
        self.collectionView.collectionViewLayout = layout
        
        //let collectionView = UICollectionView(frame: self.detailView.bounds, collectionViewLayout: layout)
        //collectionView.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "collectionViewCell")
        
        
        // attach long press gesture to collectionView
        
        let longPressGuesture = UILongPressGestureRecognizer.init(target: self, action: #selector(ViewController.handleLongPress(_:)))
        //var longPressGuesture:UILongPressGestureRecognizer = UILongPressGestureRecognizer.init(target: self, action: handleLongPress)
        longPressGuesture.delegate = self;
        longPressGuesture.delaysTouchesBegan = true;
        self.collectionView.addGestureRecognizer(longPressGuesture)
    }
    override func viewDidLayoutSubviews() {
        
        super.viewDidLayoutSubviews()
        
        let rowToSelect:NSIndexPath = NSIndexPath(forRow: 0, inSection: 0);  //slecting 0th row with 0th section
        self.listTableView.selectRowAtIndexPath(rowToSelect, animated: true, scrollPosition: UITableViewScrollPosition.None);
        //self.listTableView(self.listTableView, didSelectRowAtIndexPath: rowToSelect);
        tableView(self.listTableView, didSelectRowAtIndexPath: rowToSelect)
        
        //[self.listTableView:self.listTableView didSelectRowAtIndexPath:selectedCellIndexPath];
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let sections = fetchedResultsController.sections {
            let sectionInfo = sections[section]
            return sectionInfo.numberOfObjects
        }
        
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        self.listTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        let cell = listTableView.dequeueReusableCellWithIdentifier("Cell")! as UITableViewCell
        
        // Configure Table View Cell
        configureCell(cell, atIndexPath: indexPath)
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let record = fetchedResultsController.objectAtIndexPath(indexPath)
        odcRows = (record.valueForKey("rows") as? Int)!
        odcColumns = (record.valueForKey("columns") as? Int)!
        
        //odcRows = rowsArray[indexPath.row]
        //odcColumns = columnsArray[indexPath.row]
        self.collectionView.reloadData()
    }

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return odcColumns
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return odcRows
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("collectionViewCell", forIndexPath: indexPath) as! seatLayoutCell
        cell.backgroundColor = UIColor.greenColor()//UIColor.init(red: 29/255.0, green: 155/255.0, blue: 46/255.0, alpha: 1.0)
        cell.seatLabel.text = "1234567"//String(indexPath.row)
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize
    {
        return CGSizeMake(75, 75)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets
    {
        return UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
      
//        if let cell = collectionView.cellForItemAtIndexPath(indexPath) {
//            //cell.textla
//            
//        } else {
//            // Error indexPath is not on screen: this should never happen.
//        }
    }
    
    func handleLongPress(longPressGuesture:UILongPressGestureRecognizer) {
        if longPressGuesture.state == UIGestureRecognizerState.Began {
            let p = longPressGuesture.locationInView(self.collectionView)
            let indexPath = self.collectionView.indexPathForItemAtPoint(p)
            
            if let index = indexPath {
                let cell = self.collectionView.cellForItemAtIndexPath(index) as! seatLayoutCell
                cell.backgroundColor = cell.userInteractionEnabled ? UIColor.grayColor() : UIColor.init(red: 40/255.0, green: 125/255.0, blue: 255/255.0, alpha: 1.0)
                cell.seatLabel.text = ""
                cell.userInteractionEnabled = cell.userInteractionEnabled ? false : true
                
                // do stuff with your cell, for example print the indexPath
            } else {
            }
        } else {
            return
        }
    }
    /*
    @IBAction func newODCActionClick(sender: AnyObject) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedObjectCotext = appDelegate.managedObjectContext
        let entityDescription = NSEntityDescription.entityForName("Odc", inManagedObjectContext:managedObjectCotext)
        let newOdc = NSManagedObject(entity: entityDescription!, insertIntoManagedObjectContext:managedObjectCotext)
        
        newOdc.setValue("ODC-1", forKey: "odcName")
        newOdc.setValue(3, forKey: "rows")
        newOdc.setValue(4, forKey: "columns")
        
       
        
        //let documentDirectoryURL =  try! NSFileManager().URLForDirectory(.DocumentDirectory, inDomain: .UserDomainMask, appropriateForURL: nil, create: true)
        
         //NSLog("%@", documentDirectoryURL)
        
        do {
            try newOdc.managedObjectContext?.save()
        } catch {
            print(error)
        }
    }
 */
    
    lazy var fetchedResultsController: NSFetchedResultsController = {
        // Initialize Fetch Request
        let fetchRequest = NSFetchRequest(entityName: "Odc")
        
        // Add Sort Descriptors
        let sortDescriptor = NSSortDescriptor(key: "odcName", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        // Initialize Fetched Results Controller
        let fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: appDelegate.managedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
        
        // Configure Fetched Results Controller
        fetchedResultsController.delegate = self
        
        return fetchedResultsController
    }()
    
    func controller(controller: NSFetchedResultsController, didChangeObject anObject: AnyObject, atIndexPath indexPath: NSIndexPath?, forChangeType type: NSFetchedResultsChangeType, newIndexPath: NSIndexPath?) {
        switch (type) {
        case .Insert:
            if let indexPath = newIndexPath {
                self.listTableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            }
            break;
        case .Delete:
            if let indexPath = indexPath {
                self.listTableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            }
            break;
        case .Update:
            if let indexPath = indexPath {
                let cell = self.listTableView.cellForRowAtIndexPath(indexPath)
                configureCell(cell!, atIndexPath: indexPath)
            }
            break;
        case .Move:
            if let indexPath = indexPath {
                self.listTableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            }
            
            if let newIndexPath = newIndexPath {
                self.listTableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Fade)
            }
            break;
        }
    }
    
    func configureCell(cell: UITableViewCell, atIndexPath indexPath: NSIndexPath) {
        // Fetch Record
        if(fetchedResultsController.fetchedObjects?.count > 0) {
            let record = fetchedResultsController.objectAtIndexPath(indexPath)
            
            //if (record.count > 0) {
                if let name = record.valueForKey("odcName") as? String {
                    cell.textLabel?.text = name
                }
            //}
        }
        
        // Update Cell
       
        
//        if let done = record.valueForKey("done") as? Bool {
//            cell.doneButton.selected = done
//        }
    }
}

