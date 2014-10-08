//
//  AddReviewFormViewController.m
//  RECRU
//
//  Created by Brian Quach on 2014-10-07.
//  Copyright (c) 2014 Givery Technology. All rights reserved.
//

#import "AddReviewFormViewController.h"
#import "AddReviewForm.h"

@interface AddReviewFormViewController ()



@end

@implementation AddReviewFormViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)awakeFromNib {
    self.formController.form = [[AddReviewForm alloc] init];
}

//- (void)addReview:(UITableViewCell<FXFormFieldCell> *)cell {
- (void)addReview {
    AddReviewForm *form = self.formController.form;
    NSLog(@"%@", form.jobField);
    NSDictionary *data = @{
                           @"jobPosition" : form.position,
                           @"additionalInformation" : form.additionalInformation};
    NSData *jsonBody;
    NSError *error1 = nil;
    if ([NSJSONSerialization isValidJSONObject:data]) {
        jsonBody = [NSJSONSerialization dataWithJSONObject:data options:NSJSONWritingPrettyPrinted error:&error1];
        
        if (jsonBody != nil && error1 == nil) {
            NSString *jsonString = [[NSString alloc] initWithData:jsonBody encoding:NSUTF8StringEncoding];
            
            NSLog(@"JSON: %@", jsonString);
//            [jsonString release];
        }
        
    }

//    NSString *post = [[NSString alloc] initWithFormat:@"{\"jobPosition\":\"test\",\"additionalInformation\":\"None\"}"];
    NSURL *url = [NSURL URLWithString:@"http://localhost:3000"];
//    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
//    NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:url];
    [request setHTTPMethod:@"POST"];
//    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
//    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:[NSString stringWithFormat:@"%d", [(NSData *)jsonBody length]] forHTTPHeaderField:@"Content-Length"];
    [request setHTTPBody:jsonBody];
//    [request setHTTPBody:postData];
    NSError *error = [[NSError alloc] init];
    NSHTTPURLResponse *response = nil;
    
    NSData *urlData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    NSLog(@"Response code: %ld", (long)[response statusCode]);
    
    if ([response statusCode] >= 200 && [response statusCode] < 300) {
        NSLog(@"OK");
        NSString *responseData = [[NSString alloc] initWithData:urlData encoding:NSUTF8StringEncoding];
        NSLog(@"Response: %@", responseData);
        [[[UIAlertView alloc] initWithTitle:@"Login Form Submitted"
                                    message:responseData
                                   delegate:nil
                          cancelButtonTitle:nil
                          otherButtonTitles:@"OK", nil] show];
//        self.inputField.text = responseData;
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
