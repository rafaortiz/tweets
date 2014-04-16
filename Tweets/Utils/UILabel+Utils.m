//
//  UILabel+Utils.m
//  Tweets
//
//  Created by Rafael Ortiz on 16/04/14.
//  Copyright (c) 2014 Rafal Ortiz. All rights reserved.
//

#import "UILabel+Utils.h"

@implementation UILabel (Utils)

- (void) heightToFit
{
    CGRect rect = [self.text boundingRectWithSize:CGSizeMake(self.frame.size.width, CGFLOAT_MAX) options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading) attributes:@{NSFontAttributeName:self.font} context:nil];
	self.height = rect.size.height;
}

@end
