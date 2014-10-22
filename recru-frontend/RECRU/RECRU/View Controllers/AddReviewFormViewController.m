//
//  AddReviewFormViewController.m
//  RECRU
//
//  Created by Brian Quach on 2014-10-07.
//  Copyright (c) 2014 Givery Technology. All rights reserved.
//

#import "AddReviewFormViewController.h"
#import "AddReviewForm.h"
#import "Review.h"

@interface AddReviewFormViewController ()



@end

@implementation AddReviewFormViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.formController.form = [[Review alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (void)addReview:(UITableViewCell<FXFormFieldCell> *)cell {
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
//        //                              @"location" : [NSNumber numberWithInteger:form.location],
//        NSDictionary *newData = @{
//                                  @"company" : form.company,
//                                  @"location" : [NSNumber numberWithInteger:form.location],
//                                  @"jobPosition" : form.jobPosition,
//                                  @"jobField" : form.jobField,
//                                  @"additionalInformation" : form.additionalInformation,
//                                  //                    @"interviewProcess" : form.interviewProcess,
//                                  @"difficulty" : @1, // form.difficulty,
//                                  @"overallExperience" : @1, // form.overallExperience,
//                                  //                              @"interviewOutcome" : form.interviewOutcome,
//                                  //                              @"recommendEmployer" : [NSNumber numberWithBool:form.recommendEmployer]
//                                  };
//        NSData *jsonBody;
//        NSError *error1 = nil;
//        if ([NSJSONSerialization isValidJSONObject:newData]) {
//            jsonBody = [NSJSONSerialization dataWithJSONObject:newData options:NSJSONWritingPrettyPrinted error:&error1];
//            
//            if (jsonBody != nil && error1 == nil) {
//                NSString *jsonString = [[NSString alloc] initWithData:jsonBody encoding:NSUTF8StringEncoding];
//                
//                NSLog(@"JSON: %@", jsonString);
//            }
//            
//        }
        NSLog(@"Calling client");
        RecruAPIClient *client = [RecruAPIClient sharedRecruAPIClient];
                NSLog(@"Submitting");
        [client submitReview:form];
        NSLog(@"Done!");
        
//        client.delegate = self;
//        [client submitNewReview:newData];
    }

    // End new
//    AddReviewForm *form = self.formController.form;
//    NSLog(@"%@", form.jobField);
//    NSDictionary *data = @{
//                           @"jobPosition" : form.position,
//                           @"additionalInformation" : form.additionalInformation};
//    NSData *jsonBody;
//    NSError *error1 = nil;
//    if ([NSJSONSerialization isValidJSONObject:data]) {
//        jsonBody = [NSJSONSerialization dataWithJSONObject:data options:NSJSONWritingPrettyPrinted error:&error1];
//        
//        if (jsonBody != nil && error1 == nil) {
//            NSString *jsonString = [[NSString alloc] initWithData:jsonBody encoding:NSUTF8StringEncoding];
//            
//            NSLog(@"JSON: %@", jsonString);
//        }
//        
//    }
//
//    NSURL *url = [NSURL URLWithString:@"http://localhost:3000"];
//    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
//    [request setURL:url];
//    [request setHTTPMethod:@"POST"];
//    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
//    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
//    [request setValue:[NSString stringWithFormat:@"%d", [(NSData *)jsonBody length]] forHTTPHeaderField:@"Content-Length"];
//    [request setHTTPBody:jsonBody];
//    NSError *error = [[NSError alloc] init];
//    NSHTTPURLResponse *response = nil;
//    
//    NSData *urlData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
//    
//    NSLog(@"Response code: %ld", (long)[response statusCode]);
//    
//    if ([response statusCode] >= 200 && [response statusCode] < 300) {
//        NSLog(@"OK");
//        NSString *responseData = [[NSString alloc] initWithData:urlData encoding:NSUTF8StringEncoding];
//        NSLog(@"Response: %@", responseData);
//        [[[UIAlertView alloc] initWithTitle:@"Login Form Submitted"
//                                    message:responseData
//                                   delegate:nil
//                          cancelButtonTitle:nil
//                          otherButtonTitles:@"OK", nil] show];
////        self.inputField.text = responseData;
//    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

//- (void)recruAPIClient:(RecruAPIClient *)client didSuccessfullyAddReview:(id)review {
//    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Review Submitted"
//                                                        message:@"Your review has been submitted!"
//                                                       delegate:nil
//                                              cancelButtonTitle:@"OK"
//                                              otherButtonTitles:nil];
//    [alertView show];
//}
//
//- (void)recruAPIClient:(RecruAPIClient *)client didFailWithError:(NSError *)error {
//    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error Submitting Review"
//                                                        message:[NSString stringWithFormat:@"%@", error]
//                                                       delegate:nil
//                                              cancelButtonTitle:@"OK"
//                                              otherButtonTitles:nil];
//    [alertView show];
//}

@end
