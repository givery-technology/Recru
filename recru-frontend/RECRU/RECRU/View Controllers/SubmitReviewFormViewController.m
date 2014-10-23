//
//  AddReviewFormViewController.m
//  RECRU
//
//  Created by Brian Quach on 2014-10-07.
//  Copyright (c) 2014 Givery Technology. All rights reserved.
//

#import "SubmitReviewFormViewController.h"

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
        NSLog(@"Calling client");
        RecruAPIClient *client = [RecruAPIClient sharedRecruAPIClient];
        NSLog(@"Submitting");
        [[client submitReview:form]continueWithSuccessBlock:^id(BFTask *task) {
            NSLog(@"%@", task.result);
            return nil;
        }];
        NSLog(@"Done!");
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
//- (IBAction)submitData:(id)sender {
//    
//    NSString *post = [[NSString alloc] initWithFormat:@"{\"name\":\"test\"}"];
//    NSURL *url = [NSURL URLWithString:@"http://localhost:3000"];
//    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
//    NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
//    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
//    [request setURL:url];
//    [request setHTTPMethod:@"POST"];
//    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
//    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
//    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
//    [request setHTTPBody:postData];
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
//        self.inputField.text = responseData;
//    }
@end
