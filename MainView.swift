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

       /* let getQuestionResults = Post()
        getQuestionResults.setData(10)
        getQuestionResults.setPostURL("http://horatiothomas.com/shouldI/post/questionData.php")
        getQuestionResults.uploadTasks*/
        

        let getQuestionURL = NSURL(string: "http://horatiothomas.com/shouldI/get/questionOnLoad.php");
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
                //this should only be run once when the user opens the app for the first time. This returns an Int being the userID which should be stored in internal memory
                let getNewUserURL = NSURL(string: "http://horatiothomas.com/shouldI/get/newUser.php")
                let sharedSession = NSURLSession.sharedSession()
                let downLoadTask2: NSURLSessionDownloadTask =
                    sharedSession.downloadTaskWithURL(getNewUserURL!,
                    completionHandler: { (location: NSURL!, response:
                    NSURLResponse!, error: NSError!) -> Void in
        
                    var urlContents = NSString(contentsOfURL: location, encoding: NSUTF8StringEncoding, error: nil)
                    println(urlContents!);
                })
                downLoadTask2.resume()
                
                
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
