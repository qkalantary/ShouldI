//
//  AddQuestion.swift
//  ShouldI
//
//  Created by Q Kalantary on 11/15/14.
//  Copyright (c) 2014 Q Kalantary. All rights reserved.
//

import UIKit

class AddQuestion: UIViewController {

    @IBOutlet weak var questionEntry: UITextView!
    
    //var clearsOnBeginEditing: true

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.titleView =  UIImageView(image: UIImage(named: "cutoutAnt.png"))

        
        questionEntry.clearsOnInsertion = true
       // questionEntry.
      //  questionEntry.didBeginEditing
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func posted(sender: UIBarButtonItem) {
    
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
