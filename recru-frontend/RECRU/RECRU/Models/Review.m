//
//  Review.m
//  RECRU
//
//  Created by Brian Quach on 2014-10-09.
//  Copyright (c) 2014 Givery Technology. All rights reserved.
//

#import "Review.h"

@implementation Review

@synthesize fields = _fields;

- (NSArray *)fields {
    
    _fields = @[@{FXFormFieldKey: @"company",
                  FXFormFieldTitle: @"Company"},
                
                @{FXFormFieldKey: @"location",
                  // Hard-coded for now, we'll move these out later
                  FXFormFieldOptions: @[@"Tokyo", @"Yokohama", @"Saitama", @"Kyoto", @"Osaka"],
                  FXFormFieldPlaceholder: @"None",
                  FXFormFieldCell: [FXFormOptionPickerCell class]},
                
                @{FXFormFieldKey: @"jobPosition",
                  FXFormFieldTitle: @"Job Position"},

                @{FXFormFieldKey: @"jobField",
                  FXFormFieldTitle: @"Job Field"},
                
                @{FXFormFieldKey: @"additionalInformation",
                  FXFormFieldTitle: @"Additional Information",
                  FXFormFieldType: FXFormFieldTypeLongText},
                
                @{FXFormFieldTitle: @"Submit Review",
                  FXFormFieldAction: @"addReview"}];
    
    return _fields;
};

@end
