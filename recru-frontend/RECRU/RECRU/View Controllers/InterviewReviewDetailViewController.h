//
//  InterviewReviewDetailViewController.h
//  RECRU
//
//  Created by Brian Quach on 2014-10-20.
//  Copyright (c) 2014 Givery Technology. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RecruAPIClient.h"

@interface InterviewReviewDetailViewController : UIViewController

@property (strong, nonatomic) Review *review;

- (id)initWithReview:(Review *)review;

@end
