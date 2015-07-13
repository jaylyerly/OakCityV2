//
//  DetailViewController.h
//  OakCityV2
//
//  Created by Josh Green on 6/10/15.
//  Copyright (c) 2015 Josh Green. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Job.h"
@interface DetailViewController : UIViewController

@property (strong, nonatomic) NSString *ttitle;
@property (strong, nonatomic) NSString *company;
@property (strong, nonatomic) NSString *desc;
@property (strong, nonatomic) NSString *url;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *companyLabel;
@property (strong, nonatomic) IBOutlet UITextView *urlTextView;
@property (strong, nonatomic) IBOutlet UIWebView *descriptionLabel;
- (void)configureView:(Job *)theJob atIndexPath:(NSIndexPath *)indexPath;
@end
