//
//  RecruAsync.m
//  RECRU
//
//  Created by Brian Quach on 2014-10-17.
//  Copyright (c) 2014 Givery Technology. All rights reserved.
//

#import "RecruAsync.h"

@implementation RecruAsync

+ (BFTask *)getReview:(NSString *)reviewId {
    BFTaskCompletionSource *task = [BFTaskCompletionSource taskCompletionSource];
    return task.task;
}
@end
