//
//  SeatDetailsViewController.swift
//  SeatAllocation
//
//  Created by Hari Kishore on 5/26/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

import UIKit

class SeatDetailsViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var empIdLabel: UILabel!
    @IBOutlet weak var seatNumLabel: UILabel!
    
    @IBAction func cancelClickAction(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: {})
    }
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

}
