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
@end

@implementation InterviewReviewDetailViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
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
    [[client getReview:@"544786337e23112ea54a0e17"]continueWithSuccessBlock:^id(BFTask *task) {
        //
        NSLog(@"%@", task.result);
        NSDictionary *jsonData = task.result;
        self.jobTitleLabel.text = jsonData[@"data"][@"jobPosition"];
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
