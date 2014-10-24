//
//  InterviewReviewDetailViewController.m
//  RECRU
//
//  Created by Brian Quach on 2014-10-20.
//  Copyright (c) 2014 Givery Technology. All rights reserved.
//

#import "InterviewReviewDetailViewController.h"

@interface InterviewReviewDetailViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *companyLogoImage;
@property (weak, nonatomic) IBOutlet UIImageView *companyBackgroundImage;
@property (weak, nonatomic) IBOutlet UILabel *jobTitleLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *jobTitleLabelWidthConstraint;
@property (weak, nonatomic) IBOutlet UILabel *interviewDetailLabel;
@property (weak, nonatomic) IBOutlet UILabel *stepsLabel;
@property (weak, nonatomic) IBOutlet UILabel *moreDetailLabel;
@property (weak, nonatomic) IBOutlet UILabel *commentsLabel;
@property (weak, nonatomic) IBOutlet UILabel *additionalInformationLabel;
@end

@implementation InterviewReviewDetailViewController

- (id)initWithReview:(Review *)review {
    NSLog(@"Calling init");
    self = [super init];
    if (self) {
        self.review = review;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"reviewId: %@", self.review.reviewId);
    NSLog(@"shit: %@", self.shit);
    if (self.shit) {
        RecruAPIClient *recruClient = [RecruAPIClient sharedRecruAPIClient];
        [[recruClient getReviewWithId:self.shit]continueWithSuccessBlock:^id(BFTask *task) {
            //
            NSLog(@"Result: %@", task.result);
            
            // Is this fine or should we use NSJSONSerialization
            NSDictionary *jsonData = task.result;
            Review *temp = [[Review alloc] initWithData:jsonData[@"data"]];
            
            NSLog(@"Assigning review to self");
            self.review = temp;
            NSLog(@"Loading own review");
            //        self.review = jsonData;
            //        self.jobTitleLabel.text = jsonData[@"data"][@"jobPosition"];
            [self loadReviewData];
            return nil;
        }];
    } else {
        NSLog(@"No shit found");
    }
}

- (void)loadReviewData {
    self.jobTitleLabel.text = self.review.jobPosition;
    self.additionalInformationLabel.text = self.review.additionalInformation;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addReviewButton:(UIButton *)sender {
}

- (IBAction)loadTestReviewButton:(UIButton *)sender {
//    self.jobTitleLabel.text = @"Sofware Engineer";
    RecruAPIClient *client = [RecruAPIClient sharedRecruAPIClient];
    [[client getReviewWithId:@"5448bb54f320c1a6be1a7d3d"]continueWithSuccessBlock:^id(BFTask *task) {
        //
        NSLog(@"Result: %@", task.result);
        
        // Is this fine or should we use NSJSONSerialization
        NSDictionary *jsonData = task.result;
        Review *temp = [[Review alloc] initWithData:jsonData[@"data"]];
        
        NSLog(@"Assigning review to self");
        self.review = temp;
        NSLog(@"Loading own review");
//        self.review = jsonData;
//        self.jobTitleLabel.text = jsonData[@"data"][@"jobPosition"];
        [self loadReviewData];
        return nil;
    }];
//    [self.jobTitleLabel setNeedsUpdateConstraints];
//    [self.jobTitleLabel updateConstraints];
//    [super updateViewConstraints];

    //    self.jobTitleLabel.setNeedsUpdateConstraints;
//        self.jobTitleLabelWidthConstraint.constant =
    // We cannot use sizeToFit with autolayout
    // [self.jobTitleLabel sizeToFit];
}
@end
