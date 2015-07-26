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
    [super viewDidLoad];
    self.titleLabel.text = self.theJob.title;
    self.companyLabel.text = self.theJob.company;
    if(self.theJob.url != (NSString *)[NSNull null]) {
        self.urlTextView.text = self.theJob.url;
    }
    else {
        self.urlTextView.text = @"No URL Provided";
    }
    [self.descriptionLabel loadHTMLString:self.theJob.desc baseURL:nil];
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (void)configureView:(Job *)theJob {
    self.theJob = theJob;
}

@end