//
//  RecruAPIClient.h
//  RECRU
//
//  Created by Brian Quach on 2014-10-06.
//  Copyright (c) 2014 Givery Technology. All rights reserved.
//

#import <AFHTTPSessionManager.h>
#import <BFTask.h>
#import <BFTaskCompletionSource.h>
#import "Review.h"

@protocol RecruAPIClientDelegate;

@interface RecruAPIClient : AFHTTPSessionManager
@property (nonatomic, weak) id<RecruAPIClientDelegate>delegate;

+ (RecruAPIClient *)sharedRecruAPIClient;
- (instancetype)initWithBaseURL:(NSURL *)url;
- (BFTask *)getReviewWithId:(NSString *)ID;
- (BFTask *)submitReview:(Review *)review;

@end

@protocol RecruAPIClientDelegate <NSObject>
@optional
- (void)recruAPIClient:(RecruAPIClient *)client didSuccessfullySubmitReview:(id)review;
- (void)recruAPIClient:(RecruAPIClient *)client didFailWithError:(NSError *)error;
@end