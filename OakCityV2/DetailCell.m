//
//  DetailCell.m
//  OakCityV2
//
//  Created by Josh Green on 6/23/15.
//  Copyright (c) 2015 Josh Green. All rights reserved.
//

#import "DetailCell.h"

@implementation DetailCell

- (void)configureCell:(Job *)aJob {
    [self.titleLabel setText:aJob.title];
    [self.companyLabel setText:aJob.company];
    
    if (aJob.logo != (NSString *)[NSNull null]) {
        [self.logoImageView setImageWithURL:[NSURL URLWithString:aJob.logo] placeholderImage:[UIImage imageNamed:@"placeholder.jpg"]];
    } else {
        [self.logoImageView setImage:[UIImage imageNamed:@"placeholder.jpg"]];
    }
}
@end
