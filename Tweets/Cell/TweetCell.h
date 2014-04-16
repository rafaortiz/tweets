//
//  TweetCell.h
//  Tweets
//
//  Created by Rafael Ortiz on 16/04/14.
//  Copyright (c) 2014 Rafal Ortiz. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Tweet;

@interface TweetCell : UITableViewCell

- (void) setup:(Tweet*)tweet;

@end
