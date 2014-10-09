//
//  Review.h
//  RECRU
//
//  Created by Brian Quach on 2014-10-09.
//  Copyright (c) 2014 Givery Technology. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <FXForms.h>

// Hard-coded for now, we'll fix this later
typedef NS_ENUM(NSInteger, Location)
{
    LocationTokyo = 0,
    LocationYokohama,
    LocationSaitama,
    LocationKyoto,
    LocationOsaka
};

@interface Review : NSObject <FXForm>

@property (nonatomic, strong, readonly) NSArray *fields;

@property (nonatomic, copy) NSString *company;
@property (nonatomic, assign) Location location;
@property (nonatomic, copy) NSString *jobPosition;
@property (nonatomic, copy) NSString *jobField;
@property (nonatomic, copy) NSString *additionalInformation;
@property (nonatomic, copy) NSString *interviewProcess;
@property (nonatomic, copy) NSString *difficulty;
@property (nonatomic, copy) NSString *overallExperience;
@property (nonatomic, copy) NSString *interviewOutcome;
@property (nonatomic) BOOL recommendEmployer;

@end
