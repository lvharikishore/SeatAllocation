//
//  MultpleLineFlowLayout.swift
//  CollectionViewDemo
//
//  Created by Hari Kishore on 5/25/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

import UIKit

let space = 2

class MultpleLineFlowLayout: UICollectionViewFlowLayout {

    var itemWidth:CGFloat
    var itemHeight:CGFloat
    
    override init() {
        itemWidth = CGFloat(75);
        itemHeight = CGFloat(75);
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func collectionViewContentSize() -> CGSize {

        let xSize = (self.collectionView?.numberOfItemsInSection(0))! * (Int(itemWidth) + space)
        let ySize = (self.collectionView?.numberOfSections())! * (Int(itemHeight) + space)
        
        return CGSizeMake(CGFloat(xSize), CGFloat(ySize));
    }
    
    override func layoutAttributesForItemAtIndexPath(indexPath: NSIndexPath) -> UICollectionViewLayoutAttributes? {
        let attributes : UICollectionViewLayoutAttributes = UICollectionViewLayoutAttributes(forCellWithIndexPath: indexPath)
        attributes.size = CGSizeMake(itemWidth, itemHeight)
        
        attributes.size = CGSizeMake(itemWidth,itemHeight);
        let xValue : CGFloat = itemWidth/2 + CGFloat(indexPath.row) * (itemWidth + CGFloat(space));
        let yValue : CGFloat = itemHeight/2 + CGFloat(indexPath.section) * (itemHeight + CGFloat(space));
        attributes.center = CGPointMake(xValue, yValue);
        return attributes;
    }
    
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        
        //let minRow = rect.origin.x > 0 ? rect.origin.x/(itemWidth + CGFloat(space)) : 0
        //let maxrow = rect.size.width/(itemWidth + CGFloat(space)) + minRow
        
        var attributes = [UICollectionViewLayoutAttributes]()
        
        for i in 0..<Int((self.collectionView?.numberOfSections())!) {
        //for var i = 0; i < self.collectionView?.numberOfSections(); i += 1 {
            for j in 0..<Int((self.collectionView?.numberOfItemsInSection(i))!) {//for j in Int(minRow)..<Int(maxrow) {
            //for var j = minRow; j < maxrow; j += 1 {
                let indexPath : NSIndexPath = NSIndexPath(forRow: Int(j), inSection: i)
                attributes.append(self.layoutAttributesForItemAtIndexPath(indexPath)!)
            }
        }
        return attributes;
    }
}
