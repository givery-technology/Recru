//
//  AddReviewForm.m
//  RECRU
//
//  Created by Brian Quach on 2014-10-07.
//  Copyright (c) 2014 Givery Technology. All rights reserved.
//

#import "AddReviewForm.h"

@implementation AddReviewForm

- (NSArray *)fields
{
    return @[
             @"company",
             @{FXFormFieldKey: @"location",
               FXFormFieldOptions: @[@"Tokyo", @"Yokohama", @"Saitama", @"Kyoto", @"Osaka"],
               FXFormFieldPlaceholder: @"None",
               FXFormFieldCell: [FXFormOptionPickerCell class]},
             @"position",
             @"jobField",
             @"additionalInformation",
             @{FXFormFieldTitle: @"Add Review",
               FXFormFieldHeader: @"",
               FXFormFieldAction: @"addReview"}
             ];
}
@end
