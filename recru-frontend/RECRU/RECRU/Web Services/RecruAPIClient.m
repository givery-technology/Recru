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

static NSString * const kAPIReview = @"/review";

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

- (BFTask *)submitReview:(Review *)review {
    BFTaskCompletionSource *deferred = [BFTaskCompletionSource taskCompletionSource];
    NSDictionary *parameters = @{
                                 @"format": @"json",
                                 @"data": @{
                                         @"company": review.company,
                                         @"location": [NSNumber numberWithInteger:review.location],
                                         @"jobPosition": review.jobPosition,
                                         @"jobField": review.jobField,
                                         @"additionalInformation": review.additionalInformation,
//                                         @"difficulty": review.difficulty,
//                                         @"overallExperience": review.overallExperience,
//                                         @"interviewOutcome": review.interviewOutcome,
//                                         @"recommendEmployer": [NSNumber numberWithBool:review.recommendEmployer]
                                         }};
    
    [self POST:@"/review" parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        [deferred setResult:responseObject];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"Error: %@", error);
        [deferred setError:error];
    }];
    
    return deferred.task;
}

- (BFTask *)getReviewWithId:(NSString *)ID {
    BFTaskCompletionSource *deferred = [BFTaskCompletionSource taskCompletionSource];
//    NSDictionary *parameters = @{@"id":ID};
    
    NSString *endPoint = @"/review/";
    endPoint = [endPoint stringByAppendingString:ID];
    NSLog(@"Endpoint URL: %@", endPoint);
    
    [self GET:endPoint parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        NSLog(@"OK");
        [deferred setResult:responseObject];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        [deferred setError:error];
    }];
    return deferred.task;
}

@end
