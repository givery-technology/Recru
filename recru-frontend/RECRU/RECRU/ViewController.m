//
//  ViewController.m
//  RECRU
//
//  Created by Brian Quach on 2014-10-06.
//  Copyright (c) 2014 Givery Technology. All rights reserved.
//

#import "ViewController.h"
#import <AFNetworking.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loginClicked:(id)sender
{

    
    NSString *post = [[NSString alloc] initWithFormat:@"{\"name\":\"test\"}"];
    NSURL *url = [NSURL URLWithString:@"http://localhost:3000"];
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:url];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
    NSError *error = [[NSError alloc] init];
    NSHTTPURLResponse *response = nil;

    NSData *urlData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    NSLog(@"Response code: %ld", (long)[response statusCode]);
    
    if ([response statusCode] >= 200 && [response statusCode] < 300) {
        NSLog(@"OK");
        NSString *responseData = [[NSString alloc] initWithData:urlData encoding:NSUTF8StringEncoding];
        NSLog(@"Response: %@", responseData);
    }
    
    [self performSegueWithIdentifier:@"loginSuccess" sender:self];
    
//    NSString *string = [NSString stringWithFormat:@"http://localhost:3000"];
//    NSURL *url = [NSURL URLWithString:string];
//    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
//    operation.responseSerializer = [AFJSONResponseSerializer serializer];
//    
//    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"SHIT"
//                                                            message:[error localizedDescription]
//                                                           delegate:nil
//                                                  cancelButtonTitle:@"OK" otherButtonTitles:nil];
//    }];
}
@end
