//
//  ConfirmationBaseViewController.m
//  RECRU
//
//  Created by Brian Quach on 2014-10-23.
//  Copyright (c) 2014 Givery Technology. All rights reserved.
//

#import "ConfirmationBaseViewController.h"

@implementation ConfirmationBaseViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *background = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height * 0.3)];
    [background setImage:[UIImage imageNamed:@"fuji.jpg"]];
}
@end
