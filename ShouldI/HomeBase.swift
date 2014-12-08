//
//  HomeBase.swift
//  ShouldI
//
//  Created by Q Kalantary on 11/15/14.
//  Copyright (c) 2014 Q Kalantary. All rights reserved.
//

import UIKit

class HomeBase: UITableViewController {

    func uicolorFromHex(rgbValue:UInt32)->UIColor{
        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let blue = CGFloat(rgbValue & 0xFF)/256.0
        
        return UIColor(red:red, green:green, blue:blue, alpha:1.0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.titleView =  UIImageView(image: UIImage(named: "cutoutAnt.png"))

        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
       
        tableView.backgroundColor = uicolorFromHex(0xBF0404)//UIColor(red: 255/255.0, green: 255/255.0, blue: 117/255.0, alpha: 1.0)
        tableView.separatorColor =  UIColor.blackColor()//UIColor(red: 0/255.0, green: 163/255.0, blue: 136/255.0, alpha: 1.0)

        
        if self.tableView.respondsToSelector("setSeparatorInset:") {
            self.tableView.separatorInset = UIEdgeInsetsZero
        }
        if self.tableView.respondsToSelector("setLayoutMargins:") {
            self.tableView.layoutMargins = UIEdgeInsetsZero
        }
        
        self.tableView.layoutIfNeeded()

            }
    
    override func viewDidAppear(animated: Bool) {
      //  print(self.parentViewController?.view)
     ///   self.tableView
     //   self.parentViewController?.view.backgroundColor = UIColor.blueColor()//

    }

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return 3
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("poll", forIndexPath: indexPath) as UITableViewCell

        // Configure the cell...
        if(indexPath.row % 2 == 0){
            //cell.backgroundColor = UIColor(red: 240/255.0, green: 199/255.0, blue: 85/255.0, alpha: 1.0)
        } else{
            //cell.backgroundColor = UIColor(red: 226/255.0, green: 173/255.0, blue: 59/255.0, alpha: 1.0)
        }
        
        //cell.backgroundColor = UIColor.clearColor()//UIColor(red: 255/255.0, green: 255/255.0, blue: 117/255.0, alpha: 1.0)
        if cell.respondsToSelector("setSeparatorInset:") {
            cell.separatorInset = UIEdgeInsetsZero
        }
        if cell.respondsToSelector("setLayoutMargins:") {
            cell.layoutMargins = UIEdgeInsetsZero
        }
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
