//
//  RecruAPIClient.h
//  RECRU
//
//  Created by Brian Quach on 2014-10-06.
//  Copyright (c) 2014 Givery Technology. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@protocol RecruAPIClientDelegate;

@interface RecruAPIClient : AFHTTPSessionManager

@property (nonatomic, weak) id<RecruAPIClientDelegate>delegate;

+ (RecruAPIClient *)sharedRecruAPIClient;
- (instancetype)initWithBaseURL:(NSURL *)url;
- (void)submitNewReview:(NSDictionary *)review;

@end

@protocol RecruAPIClientDelegate <NSObject>
@optional
- (void)recruAPIClient:(RecruAPIClient *)client didSuccessfullyAddReview:(id)review;
- (void)recruAPIClient:(RecruAPIClient *)client didFailWithError:(NSError *)error;
@end