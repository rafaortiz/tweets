//
//  UIView+Utils.h
//  Tweets
//
//  Created by Rafael Ortiz on 16/04/14.
//  Copyright (c) 2014 Rafal Ortiz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Utils)

- (void) setOrigin:(CGPoint)value;
- (void) setSize:(CGSize)value;

- (CGSize) size;

- (float) x;
- (void) setX:(float)value;

- (float) y;
- (void) setY:(float)value;

- (float) width;
- (void) setWidth:(float)value;

- (float) height;
- (void) setHeight:(float)value;

- (float) bottom;

@end
