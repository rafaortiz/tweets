//
//  Model.h
//  Tweets
//
//  Created by Rafael Ortiz on 16/04/14.
//  Copyright (c) 2014 Rafal Ortiz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject

- (id) initWithDict:(NSDictionary*)dict;
- (NSString*) getString:(NSString*)string;
- (int) getInt:(NSString*)string;
- (NSString*) getParamBoolean:(NSString*)string;

@end
