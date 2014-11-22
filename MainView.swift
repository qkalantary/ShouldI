//
//  MainView.swift
//  ShouldI
//
//  Created by Q Kalantary on 11/15/14.
//  Copyright (c) 2014 Q Kalantary. All rights reserved.
//

import UIKit

class MainView: UIViewController {
    
    
    //    @IBOutlet var swipeView: UIView
    //   let swipeRec = UISwipeGestureRecognizer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let getQuestionURL = NSURL(string: "http://localhost:8888/shouldI/get/questionOnLoad.php")
        let sharedSession = NSURLSession.sharedSession()
        let downLoadTask: NSURLSessionDownloadTask =
        sharedSession.downloadTaskWithURL(getQuestionURL!,
            completionHandler: { (location: NSURL!, response:
                NSURLResponse!, error: NSError!) -> Void in
                
                var urlContents = NSString(contentsOfURL: location, encoding: NSUTF8StringEncoding, error: nil)
                println(urlContents);
        })
        downLoadTask.resume()
        
        var swipeRight = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        swipeRight.direction = UISwipeGestureRecognizerDirection.Right
        self.view.addGestureRecognizer(swipeRight)
        
        
        var swipeLeft = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        swipeLeft.direction = UISwipeGestureRecognizerDirection.Left
        self.view.addGestureRecognizer(swipeRight)
        
        var swipeDown = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        swipeDown.direction = UISwipeGestureRecognizerDirection.Down
        
        self.view.addGestureRecognizer(swipeRight)
        self.view.addGestureRecognizer(swipeLeft)
        self.view.addGestureRecognizer(swipeDown)
        
        
        // swipeRec.addTarget(self, action: "swipedView")
        //swipeView.addGestureRecognizer(swipeRec)
       // swipeView.userInteractionEnabled = true
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.Right:
                println("Swiped right")
                
                
            case UISwipeGestureRecognizerDirection.Down:
                println("Swiped down")
                
                
            case UISwipeGestureRecognizerDirection.Left:
                println("Swiped left")
                
                
                
            default:
                break
            }
        }
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
