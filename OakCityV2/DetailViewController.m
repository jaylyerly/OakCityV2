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


-(void)viewDidLoad
{
    _titleLabel.text = self.ttitle;
    _companyLabel.text = self.company;
    _urlTextView.text = self.url;
    [_descriptionLabel loadHTMLString:self.desc baseURL:nil];
    self.automaticallyAdjustsScrollViewInsets = NO;
}

@end