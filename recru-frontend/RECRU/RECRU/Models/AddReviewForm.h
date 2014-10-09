//
//  AddReviewForm.h
//  RECRU
//
//  Created by Brian Quach on 2014-10-07.
//  Copyright (c) 2014 Givery Technology. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <FXForms.h>

//typedef NS_ENUM(NSInteger, Location)
//{
//    LocationTokyo = 0,
//    LocationYokohama,
//    LocationSaitama,
//    LocationKyoto,
//    LocationOsaka
//};

typedef NS_ENUM(NSInteger, JobField) {
    Business = 0,
    Sports = 1
};

@interface AddReviewForm : NSObject <FXForm>

@property (nonatomic, copy) NSString *company;
//@property (nonatomic, assign) Location location;
@property (nonatomic, copy) NSString *position;
@property (nonatomic, copy) NSString *jobField;
@property (nonatomic, copy) NSString *additionalInformation;
@property (nonatomic, copy) NSString *interviewProcess;
@property (nonatomic, copy) NSString *difficulty;
@property (nonatomic, copy) NSString *overallExperience;
@property (nonatomic, copy) NSString *interviewOutcome;

@end
