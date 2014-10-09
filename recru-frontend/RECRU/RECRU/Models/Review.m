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
                  FXFormFieldPlaceholder: @"None",
                  FXFormFieldCell: [FXFormOptionPickerCell class]},
                
                @{FXFormFieldKey: @"",
                  FXFormFieldTitle: @"Additional Information",
                  FXFormFieldType: FXFormFieldTypeLongText},
                
                @{FXFormFieldTitle: @"Submit Review",
                  FXFormFieldAction: @"addReview"}];
    
    return _fields;
//    return @[
//             @"company",
//             @{FXFormFieldKey: @"location",
//               FXFormFieldOptions: @[@"Tokyo", @"Yokohama", @"Saitama", @"Kyoto", @"Osaka"],
//               FXFormFieldPlaceholder: @"None",
//               FXFormFieldCell: [FXFormOptionPickerCell class]},
//             @"position",
//             @"jobField",
//             @{FXFormFieldKey: @"additionalInformation",
//               FXFormFieldType: FXFormFieldTypeLongText,
//               FXFormFieldTitle: @"Additional Information"},
//             @{FXFormFieldTitle: @"Add Review",
//               FXFormFieldHeader: @"",
//               FXFormFieldAction: @"addReview"}
//             ];
};

@end
