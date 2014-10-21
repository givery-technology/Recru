//
//  RecruAsync.h
//  RECRU
//
//  Created by Brian Quach on 2014-10-17.
//  Copyright (c) 2014 Givery Technology. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <BFTask.h>
#import <BFTaskCompletionSource.h>
#import "Review.h"

@interface RecruAsync : NSObject

+ (BFTask *)getReview:(NSString *)reviewId;
+ (BFTask *)submitReview:(Review *)review;

@end
