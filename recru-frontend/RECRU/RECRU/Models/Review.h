//
//  Review.h
//  RECRU
//
//  Created by Brian Quach on 2014-10-09.
//  Copyright (c) 2014 Givery Technology. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <FXForms.h>

// Overall Experience
typedef NS_ENUM(NSInteger, OverallExperience) {
    Positive = 0,
    Neutral,
    Negative
};

// Interview Length
typedef NS_ENUM(NSInteger, InterviewLength) {
    FourtyToSixty = 0
};

// Difficulty
typedef NS_ENUM(NSInteger, Difficulty) {
    VeryHard = 0,
    Hard,
    Average,
    Easy,
    VeryEasy
};

// Interview Outcome
typedef NS_ENUM(NSInteger, InterviewOutcome) {
    Offer,
    NoOffer,
    DoNotDisclose
};

// Steps
// Multi-select

// Position of Interviewers
// Drop-down field

// Personality of Interviewers
// Enum

// Position Applied For
// String

// Location
//
// Hard-coded for now, we'll fix this later and create a class for Locations
typedef NS_ENUM(NSInteger, Location)
{
    LocationTokyo = 0,
    LocationYokohama,
    LocationSaitama,
    LocationKyoto,
    LocationOsaka
};

// Date of Interview

@interface Review : NSObject <FXForm>

@property (nonatomic, strong, readonly) NSArray *fields;

@property (nonatomic, copy) NSString *reviewId;

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

- (instancetype)initWithData:(NSDictionary *)dictionary;

@end
