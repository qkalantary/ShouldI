//
//  MainView.swift
//  ShouldI
//
//  Created by Q Kalantary on 11/15/14.
//  Copyright (c) 2014 Q Kalantary. All rights reserved.
//

import UIKit
import Foundation

class MainView: UIViewController {
    
    
    //    @IBOutlet var swipeView: UIView
    //   let swipeRec = UISwipeGestureRecognizer()

    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
       
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
                getQuestion()
                
                
            case UISwipeGestureRecognizerDirection.Down:
                println("Swiped down")
                
                
            case UISwipeGestureRecognizerDirection.Left:
                println("Swiped left")
                
                
                
            default:
                break
            }
        }
    }
    
    func HTTPsendRequest(request: NSMutableURLRequest,
        callback: (String, String?) -> Void) {
            let task = NSURLSession.sharedSession()
                .dataTaskWithRequest(request) {
                    (data, response, error) -> Void in
                    if error {
                        callback(“,”, error.localizedDescription)
                    } else {
                        callback(NSString(data: data,
                            encoding: NSUTF8StringEncoding), nil)
                    }
            }
            
            task.resume()
    }
    func HTTPGet(url: String, callback: (String, String?) -> Void) {
        var request = NSMutableURLRequest(URL: NSURL(string: url))
        HTTPsendRequest(request, callback)
    }
    
    HTTPGet(“http://localhost:8888/shouldI/get/questionOnLoad.php") {
    (data: String, error: String?) -> Void in
    if error {
    println(error)
    } else {
    println(data)
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
