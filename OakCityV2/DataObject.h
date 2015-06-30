//
//  DataObject.h
//  OakCityV2
//
//  Created by Josh Green on 6/29/15.
//  Copyright (c) 2015 Josh Green. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataObject : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *company;
@property (nonatomic, strong) NSString *desc;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *logo;
@property (nonatomic, assign) BOOL isData;

@end
