//
//  DetailViewController.m
//  OakCityV2
//
//  Created by Josh Green on 6/10/15.
//  Copyright (c) 2015 Josh Green. All rights reserved.
//

#import "DetailViewController.h"
#import "AFNetworking/UIImageView+AFNetworking.h"

@implementation DetailViewController


-(void)viewDidLoad {
    self.titleLabel.text = self.ttitle;
    self.companyLabel.text = self.company;
    self.urlTextView.text = self.url;
    [self.descriptionLabel loadHTMLString:self.desc baseURL:nil];
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (void)configureView:(Job *)theJob atIndexPath:(NSIndexPath *)indexPath {
    self.ttitle = theJob.title;
    self.company = theJob.company;
    if (theJob.url != (NSString *)[NSNull null]) {
        self.url = theJob.url;
    }
    else {
        self.url = @"No URL Provided";
    }
    self.desc = theJob.desc;
}

@end