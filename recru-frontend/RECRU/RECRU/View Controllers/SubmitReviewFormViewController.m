//
//  AddReviewFormViewController.m
//  RECRU
//
//  Created by Brian Quach on 2014-10-07.
//  Copyright (c) 2014 Givery Technology. All rights reserved.
//

#import "SubmitReviewFormViewController.h"
#import "ReviewSubmittedConfirmationViewController.h"

@interface SubmitReviewFormViewController ()
@end

@implementation SubmitReviewFormViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.formController.form = [[Review alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)blah {
    
}

- (void)addReview {
    Review *form = self.formController.form;
    
    if (!form.company.length) {
        [[[UIAlertView alloc] initWithTitle:@"No company entered!"
                                    message:@"Enter a company name!"
                                   delegate:nil
                          cancelButtonTitle:nil
                          otherButtonTitles:@"OK", nil] show];
    } else if (!form.jobPosition.length) {
        [[[UIAlertView alloc] initWithTitle:@"No job position entered!"
                                    message:@"Enter a job position!"
                                   delegate:nil
                          cancelButtonTitle:nil
                          otherButtonTitles:@"OK", nil] show];
    } else if (!form.jobField.length) {
        [[[UIAlertView alloc] initWithTitle:@"No job field entered!"
                                    message:@"Enter a job field!"
                                   delegate:nil
                          cancelButtonTitle:nil
                          otherButtonTitles:@"OK", nil] show];
    } else {
        NSLog(@"%@", form.jobField);
        
        // Submit the form
        RecruAPIClient *client = [RecruAPIClient sharedRecruAPIClient];
        [[client submitReview:form]continueWithSuccessBlock:^id(BFTask *task) {
            NSLog(@"%@", task.result);
            [self performSegueWithIdentifier:@"ShowConfirmation" sender:self];
            return nil;
        }];
        
        NSLog(@"Done!");
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
@end
