//
//  ObPost.m
//  ShouldI
//
//  Created by Horatio Thomas on 12/6/14.
//  Copyright (c) 2014 Q Kalantary. All rights reserved.
//

#import "ObPost.h"

@interface ObPost ()
// define private properties
// define private methods

@end

@implementation ObPost
NSData *postData;
NSURL *postURL;
NSURLRequest *request;



+ (void)initialize {
    NSLog(@"initialize");
    postData = [[NSData alloc] init];
    postURL = [[NSURL alloc] initWithString:@"http://horatiothomas.com/shouldI/post/questionData.php"];
    request = [NSURLRequest requestWithURL:
                             postURL];
    /*NSURLSessionDataTask *downloadTask = [[NSURLSession sharedSession]
                                          dataTaskWithURL:postURL completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                              // 4: Handle response here
                                              NSLog(@"handle response");
                                          }]; */
    
    // 1
    NSURL *url = [NSURL URLWithString:@"http://horatiothomas.com/shouldI/post/questionData.php"];
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:config];
    
    // 2
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    request.HTTPMethod = @"POST";
    
    // 3
    NSDictionary *dictionary = @{@"userID": @10};
    NSError *error = nil;
    NSData *data = [NSJSONSerialization dataWithJSONObject:dictionary
                                                   options:kNilOptions error:&error];
    
    if (!error) {
        // 4
        NSURLSessionUploadTask *uploadTask = [session uploadTaskWithRequest:request
             fromData:data completionHandler:^(NSData *data,NSURLResponse *response,NSError *error) {
                // Handle response here
                NSLog(@"response handled");
                               // NSLog(@"%@",response);
                NSString *answer = [[NSString alloc] initWithContentsOfURL:url
                                    encoding:NSUTF8StringEncoding
                                    error:&error];
                                        NSLog(@"%@", answer);
                                                                       
                                }];
        
        // 5
        [uploadTask resume];
    }

    
}

-(id)initWithName:(NSData *)data_ url:(NSURL *)url_
{
    self = [super init];
   /* NSLog(@"initwithname");

    self = [super init];
    if (postData) {
        postData = data_;
    }
    if (postURL) {
        postURL = url_;
    }
    return self;
    */
    return self;
}

- (void)setData:(int)data {
    NSLog(@"setdata");

    [[NSUserDefaults standardUserDefaults] setInteger: data forKey: @"postData"];
}

- (void)setPostURL:(NSString*)url {
    NSLog(@"setPostURL");

    postURL = [[NSURL alloc]initWithString:url];
}

/*var postData : NSData
var postURL : NSURL

init (data : NSData, url : NSURL) {
    self.postData = data
    self.postURL = url
}

func setData(data: Int){
    self.postData = NSData(data)
}
func setPostURL(URL : String){
    self.postURL = NSURL(String: URL)
}
reque
let sharedSession = NSURLSession.sharedSession()
let postRequest = NSURLRequest(postURL)
let uploadTask: NSURLSessionUploadTaskWithRequest = sharedSession.uploadTaskWithRequest(request: postRequest,
                                                                                        fromData: postData?,
                                                                                        completionHandler: { (questionResults: NSData!,
                                                                                                              respose: NSURLResponse!,
                                                                                                              error: NSError!) -> Void in
                                                                                            
                                                                                            var returnedData = NSStirng(content: questionResults)
                                                                                            println(returnedData)
                                                                                            
                                                                                        })
 


} */

@end
