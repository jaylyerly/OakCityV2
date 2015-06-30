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
    [_titleLabel loadHTMLString:self.ttitle baseURL:nil];
    [_companyLabel loadHTMLString:self.company baseURL:nil];
    [_urlLabel loadHTMLString:self.url baseURL:nil];
    _urlLabel.dataDetectorTypes = UIDataDetectorTypeLink;
    [_descriptionLabel loadHTMLString:self.desc baseURL:nil];
}
@end













    /*
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    self.scrollView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    self.scrollView.contentSize = CGSizeMake(380,1500);
    */
    //Title Label
    
    //_titleLabel = [[UIWebView alloc] initWithFrame:CGRectMake(20,20,360,40)];
    //[_titleLabel loadHTMLString:self.ttitle baseURL:nil];
    //[self.scrollView addSubview:_titleLabel];
    
    //Company Label
    
    //_companyLabel = [[UIWebView alloc] initWithFrame:CGRectMake(20,60,360,40)];
    //[_companyLabel loadHTMLString:self.company baseURL:nil];
    //[self.scrollView addSubview:_companyLabel];
    
    //URL Label
    
    //_urlLabel = [[UIWebView alloc] initWithFrame:CGRectMake(20,100,360,40)];
    //[_urlLabel loadHTMLString:self.url baseURL:nil];
    //_urlLabel.dataDetectorTypes = UIDataDetectorTypeLink;
    //[self.scrollView addSubview:_urlLabel];

    //Description Label

    //_descriptionLabel = [[UIWebView alloc] initWithFrame:CGRectMake(20,140,360,1200)];
    //[_descriptionLabel loadHTMLString:self.desc baseURL:nil];
    //[self.scrollView addSubview:_descriptionLabel];

    /*
    [self.view addSubview:self.scrollView];
    */