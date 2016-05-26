//
//  ViewController.swift
//  SeatAllocation
//
//  Created by Hari Kishore on 5/26/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {

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
        
        let layout : MultpleLineFlowLayout = MultpleLineFlowLayout.init()
        self.collectionView.collectionViewLayout = layout
        
        //let collectionView = UICollectionView(frame: self.detailView.bounds, collectionViewLayout: layout)
        //collectionView.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "collectionViewCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return odcList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        self.listTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        let cell = listTableView.dequeueReusableCellWithIdentifier("Cell")! as UITableViewCell
        cell.textLabel?.text = self.odcList[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        odcRows = rowsArray[indexPath.row]
        odcColumns = columnsArray[indexPath.row]
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
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("collectionViewCell", forIndexPath: indexPath)
        
        cell.backgroundColor = UIColor.greenColor()
        
        for lbl in cell.contentView.subviews {
            if (lbl.isKindOfClass(UILabel)) {
                lbl.removeFromSuperview()
            }
        }
        //UILabel *cellLabel = (UILabel*)[cell ViewWithTag:25];
        let lblTitle : UILabel = UILabel.init(frame: CGRect(x: 0, y: 10, width: cell.bounds.size.width, height: 40))
        lblTitle.tag = 200
        lblTitle.text = String(indexPath.row)
        cell.contentView.addSubview(lblTitle)
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize
    {
        return CGSizeMake(50, 50)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets
    {
        return UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
      
        if let cell = collectionView.cellForItemAtIndexPath(indexPath) {
            //cell.textla
        } else {
            // Error indexPath is not on screen: this should never happen.
        }
    }

}

