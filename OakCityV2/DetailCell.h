//
//  DetailCell.h
//  OakCityV2
//
//  Created by Josh Green on 6/23/15.
//  Copyright (c) 2015 Josh Green. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *companyLabel;
@property (weak, nonatomic) IBOutlet UIImageView *logoImageView;
@end