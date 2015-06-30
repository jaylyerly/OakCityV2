//
//  DetailViewController.h
//  OakCityV2
//
//  Created by Josh Green on 6/10/15.
//  Copyright (c) 2015 Josh Green. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (weak, nonatomic) NSString *ttitle;
@property (weak, nonatomic) NSString *company;
@property (weak, nonatomic) NSString *desc;
@property (weak, nonatomic) NSString *url;
//@property (strong, nonatomic) UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIWebView *titleLabel;
@property (strong, nonatomic) IBOutlet UIWebView *companyLabel;
@property (strong, nonatomic) IBOutlet UIWebView *urlLabel;
@property (strong, nonatomic) IBOutlet UIWebView *descriptionLabel;
@end
