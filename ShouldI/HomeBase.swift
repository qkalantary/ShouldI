//
//  HomeBase.swift
//  ShouldI
//
//  Created by Q Kalantary on 11/15/14.
//  Copyright (c) 2014 Q Kalantary. All rights reserved.
//

import UIKit

class HomeBase: UITableViewController {
    @IBOutlet var homeView: UITableView!

    func uicolorFromHex(rgbValue:UInt32)->UIColor{
        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let blue = CGFloat(rgbValue & 0xFF)/256.0
        
        return UIColor(red:red, green:green, blue:blue, alpha:1.0)
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    var count : Int = 0
    var numberRows : Int = 0
    var questArr : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        println("View Loaded Here")
        self.tableView.dataSource = self
        self.tableView.delegate = self

        tableView.backgroundColor = uicolorFromHex(0xBF0404)//UIColor(red: 255/255.0, green: 255/255.0, blue: 117/255.0, alpha: 1.0)
        tableView.separatorColor =  UIColor.blackColor()//UIColor(red: 0/255.0, green: 163/255.0, blue: 136/255.0, alpha: 1.0)
        self.navigationItem.titleView =  UIImageView(image: UIImage(named: "cutoutAnt.png"))
      
        if self.tableView.respondsToSelector("setSeparatorInset:") {
            self.tableView.separatorInset = UIEdgeInsetsZero
        }
        if self.tableView.respondsToSelector("setLayoutMargins:") {
            self.tableView.layoutMargins = UIEdgeInsetsZero
        }
        
        self.tableView.layoutIfNeeded()
        
//        var infoDummy : String = "Do I like pie?,4,3;should I go to the park,1,10"
//        infoDummy = mainInstance.name
//        //get this array
//        
//        var questionArray : [String] = infoDummy.componentsSeparatedByString(";")
//        println(questionArray)
//        numberRows = questionArray.count
//        questArr = questionArray

        
            }
    
    override func viewWillAppear(animated: Bool) {
        println("ViewWillAppear. I swear")
        count = 0
        // self.viewDidLoad()
        //  self.tableView.reloadData()
        var infoDummy : String = "Do I like pie?,4,3;should I go to the park,1,10"
        infoDummy = mainInstance.name
        //get this array
        
        var questionArray : [String] = infoDummy.componentsSeparatedByString(";")
        println(questionArray)
        numberRows = questionArray.count
        questArr = questionArray
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            self.tableView.beginUpdates()
            self.tableView.reloadData()
            self.tableView.endUpdates()
        })

            }
    
    override func viewDidAppear(animated: Bool) {
      //  print(self.parentViewController?.view)
     ///   self.tableView
     //   self.parentViewController?.view.backgroundColor = UIColor.blueColor()//
//viewDidLoad()
        
        
        
    }

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if numberRows <= 0 {
            return 0;
        } else {
            return numberRows - 1;
        }
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //println("cellForRowAtIndexPath called")
        var cell:feedbackCell = self.tableView.dequeueReusableCellWithIdentifier("poll") as feedbackCell
        var newArr : [String] = []
        if (indexPath.row < questArr.count) {
            newArr = questArr[indexPath.row].componentsSeparatedByString(",")
        }
        if (newArr.count == 3) {
        cell.questionView.text = newArr[0]
        cell.yesNumber.text = newArr[1]
        cell.noNumber.text = newArr[2]
        println(cell.yesNumber.text)
        }
        count = count + 1
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
    }
    
    
    

}
