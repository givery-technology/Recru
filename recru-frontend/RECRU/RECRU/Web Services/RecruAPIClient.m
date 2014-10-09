//
//  RecruAPIClient.m
//  RECRU
//
//  Created by Brian Quach on 2014-10-06.
//  Copyright (c) 2014 Givery Technology. All rights reserved.
//

#import "RecruAPIClient.h"

static NSString * const RecruAPIKey = @"LOLNOKEY";
static NSString * const RecruURLString = @"http://localhost:3000/";

@implementation RecruAPIClient

+ (RecruAPIClient *)sharedRecruAPIClient {
    static RecruAPIClient *_sharedRecruAPIClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedRecruAPIClient = [[self alloc] initWithBaseURL:[NSURL URLWithString:RecruURLString]];
    });
    return _sharedRecruAPIClient;
}

- (instancetype)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    
    if (self) {
        self.responseSerializer = [AFJSONResponseSerializer serializer];
        self.requestSerializer = [AFJSONRequestSerializer serializer];
    }
    
    return self;
}

- (void)submitNewReview:(NSDictionary *)review {
    [self POST:@"/review" parameters:review success:^(NSURLSessionDataTask *task, id responseObject) {
        //
        if ([self.delegate respondsToSelector:@selector(recruAPIClient:didSuccessfullyAddReview:)]) {
            NSLog(@"Success: Delegate responds to selector.");
            [self.delegate recruAPIClient:self didSuccessfullyAddReview:responseObject];
        } else {
            NSLog(@"Success: Delegate does not respond to selector.");
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        //
        if ([self.delegate respondsToSelector:@selector(recruAPIClient:didFailWithError:)]) {
            NSLog(@"Failure: Delegate responds to selector.");
            [self.delegate recruAPIClient:self didFailWithError:error];
        } else {
            NSLog(@"Failure: Delegate does not respond to selector.");
        }
    }];
}


@end
