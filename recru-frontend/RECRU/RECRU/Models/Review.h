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

typedef NS_ENUM(NSInteger, OverallExperience) {
    Positive = 0,
    Neutral,
    Negative
};

typedef NS_ENUM(NSInteger, InterviewLength) {
    FourtyToSixty = 0
};

typedef NS_ENUM(NSInteger, Difficulty) {
    VeryHard = 0,
    Hard,
    Average,
    Easy,
    VeryEasy
};

typedef NS_ENUM(NSInteger, Competitiveness) {
    Uncompetitive = 0,
    SomewhatUncompetitive,
    MildyComopetitive,
    SomewhatCompetitive,
    VeryCompetitive
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
