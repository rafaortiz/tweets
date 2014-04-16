//
//  UIView+Utils.m
//  Tweets
//
//  Created by Rafael Ortiz on 16/04/14.
//  Copyright (c) 2014 Rafal Ortiz. All rights reserved.
//

#import "UIView+Utils.h"

@implementation UIView (Utils)

- (CGPoint) origin { return self.frame.origin; }
- (void) setOrigin:(CGPoint)value
{
	CGRect frame = self.frame;
	frame.origin = value;
	self.frame = frame;
}

- (CGSize) size { return self.frame.size; }
- (void) setSize:(CGSize)value
{
	CGRect frame = self.frame;
	frame.size = value;
	self.frame = frame;
}

- (float) x { return self.frame.origin.x; }
- (void) setX:(float)value
{
	CGRect frame = self.frame;
	frame.origin.x = value;
	self.frame = frame;
}

- (float) y { return self.frame.origin.y; }
- (void) setY:(float)value
{
	CGRect frame = self.frame;
	frame.origin.y = value;
	self.frame = frame;
}

- (float) width { return self.frame.size.width; }
- (void) setWidth:(float)value
{
	CGRect frame = self.frame;
	frame.size.width = value;
	self.frame = frame;
}

- (float) height { return self.frame.size.height; }
- (void) setHeight:(float)value
{
	CGRect frame = self.frame;
	frame.size.height = value;
	self.frame = frame;
}

- (float) bottom { return self.frame.origin.y + self.frame.size.height; }

@end
