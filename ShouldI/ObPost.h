//
//  ObPost.h
//  ShouldI
//
//  Created by Horatio Thomas on 12/6/14.
//  Copyright (c) 2014 Q Kalantary. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ObPost : NSObject
-(id)initWithName:(NSData *)data_ url:(NSURL *)url_;
- (void)setData:(int)data;
- (void)setPostURL:(NSString*)url;
@end
