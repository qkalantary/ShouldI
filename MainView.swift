//
//  MainView.swift
//  ShouldI
//
//  Created by Q Kalantary on 11/15/14.
//  Copyright (c) 2014 Q Kalantary. All rights reserved.
//

import UIKit


class MainView: UIViewController {
    
    var questionID : String = ""
    
    @IBOutlet weak var questionView: UITextView!
    //    @IBOutlet var swipeView: UIView
    //   let swipeRec = UISwipeGestureRecognizer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
            self.navigationItem.titleView =  UIImageView(image: UIImage(named: "cutoutAnt.png"))
        
        
        let getQuestionURL = NSURL(string: "http://horatiothomas.com/shouldI/get/questionOnLoad.php");
        
        let sharedSession = NSURLSession.sharedSession()
        let downLoadTask: NSURLSessionDownloadTask =
        sharedSession.downloadTaskWithURL(getQuestionURL!,
            completionHandler: { (location: NSURL!, response:
                NSURLResponse!, error: NSError!) -> Void in
                if let location2 = location {
                var urlContents = NSString(contentsOfURL: location, encoding: NSUTF8StringEncoding, error: nil)
                    dispatch_async(dispatch_get_main_queue(),{
                        if let urlContentsArray = urlContents?.componentsSeparatedByString(","){
                            if let questionID2 = urlContentsArray[0] as? String {
                               println(questionID2)
                                self.questionID = questionID2
                            }
                            if let question = urlContentsArray[1] as? String {
                                self.questionView.text = question
                            }
                            
                        }
                        
                        
                    });
                } else {
                println("location was null")
                }
        })
        downLoadTask.resume()
        
        

                
        /*var swipeRight = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        swipeRight.direction = UISwipeGestureRecognizerDirection.Right
        self.view.addGestureRecognizer(swipeRight)
        
        
        var swipeLeft = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        swipeLeft.direction = UISwipeGestureRecognizerDirection.Left
        self.view.addGestureRecognizer(swipeRight)
        
        var swipeDown = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        swipeDown.direction = UISwipeGestureRecognizerDirection.Down
        
        self.view.addGestureRecognizer(swipeRight)
        self.view.addGestureRecognizer(swipeLeft)
        self.view.addGestureRecognizer(swipeDown)*/
        
        
        // swipeRec.addTarget(self, action: "swipedView")
        //swipeView.addGestureRecognizer(swipeRec)
       // swipeView.userInteractionEnabled = true
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func no(sender: UIButton) {
        var request = NSMutableURLRequest(URL: NSURL(string: "http://horatiothomas.com/shouldI/post/answerQuestion.php")!)
        var session = NSURLSession.sharedSession()
        request.HTTPMethod = "POST"
        
        var params = ["questionID": self.questionID, "yes": "0", "no": "1"] as Dictionary<String, String>
        
        var err: NSError?
        request.HTTPBody = NSJSONSerialization.dataWithJSONObject(params, options: nil, error: &err)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        var task = session.dataTaskWithRequest(request, completionHandler: {data, response, error -> Void in
            println("Response: \(response)")
            var strData = NSString(data: data, encoding: NSUTF8StringEncoding)
            println("Body: \(strData)")
            var err: NSError?
            var json = NSJSONSerialization.JSONObjectWithData(data, options: .MutableLeaves, error: &err) as? NSDictionary
            
            // Did the JSONObjectWithData constructor return an error? If so, log the error to the console
            if(err != nil) {
                println(err!.localizedDescription)
                let jsonStr = NSString(data: data, encoding: NSUTF8StringEncoding)
                println("Error could not parse JSON: '\(jsonStr)'")
            }
            else {
                // The JSONObjectWithData constructor didn't return an error. But, we should still
                // check and make sure that json has a value using optional binding.
                if let parseJSON = json {
                    // Okay, the parsedJSON is here, let's get the value for 'success' out of it
                    var success = parseJSON["success"] as? Int
                    println("Succes: \(success)")
                }
                else {
                    // Woa, okay the json object was nil, something went worng. Maybe the server isn't running?
                    let jsonStr = NSString(data: data, encoding: NSUTF8StringEncoding)
                    println("Error could not parse JSON: \(jsonStr)")
                }
            }
            })
        viewDidLoad()
        println("no")
    }
    
    @IBAction func yes(sender: UIButton) {
        println(self.questionID)
        var request = NSMutableURLRequest(URL: NSURL(string: "http://horatiothomas.com/shouldI/post/answerQuestion.php")!)
        var session = NSURLSession.sharedSession()
        request.HTTPMethod = "POST"
        
        var params = ["questionID": self.questionID, "yes": "1", "no": "0"] as Dictionary<String, String>
        
        var err: NSError?
        request.HTTPBody = NSJSONSerialization.dataWithJSONObject(params, options: nil, error: &err)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        var task = session.dataTaskWithRequest(request, completionHandler: {data, response, error -> Void in
            println("Response: \(response)")
            var strData = NSString(data: data, encoding: NSUTF8StringEncoding)
            println("Body: \(strData)")
            var err: NSError?
            var json = NSJSONSerialization.JSONObjectWithData(data, options: .MutableLeaves, error: &err) as? NSDictionary
            
            // Did the JSONObjectWithData constructor return an error? If so, log the error to the console
            if(err != nil) {
                println(err!.localizedDescription)
                let jsonStr = NSString(data: data, encoding: NSUTF8StringEncoding)
                println("Error could not parse JSON: '\(jsonStr)'")
            }
            else {
                // The JSONObjectWithData constructor didn't return an error. But, we should still
                // check and make sure that json has a value using optional binding.
                if let parseJSON = json {
                    // Okay, the parsedJSON is here, let's get the value for 'success' out of it
                    var success = parseJSON["success"] as? Int
                    println("Succes: \(success)")
                }
                else {
                    // Woa, okay the json object was nil, something went worng. Maybe the server isn't running?
                    let jsonStr = NSString(data: data, encoding: NSUTF8StringEncoding)
                    println("Error could not parse JSON: \(jsonStr)")
                }
            }
            })
        task.resume()
        self.viewDidLoad()
        println("yes")
        
    }
    
    /*override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }*/
    
/*
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
  */  
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
