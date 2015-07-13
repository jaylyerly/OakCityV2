//
//  DataObject.m
//  OakCityV2
//
//  Created by Josh Green on 6/29/15.
//  Copyright (c) 2015 Josh Green. All rights reserved.
//

#import "Job.h"

@interface Job ()

@property (nonatomic, readwrite) NSString *title;
@property (nonatomic, readwrite) NSString *company;
@property (nonatomic, readwrite) NSString *desc;
@property (nonatomic, readwrite) NSString *url;
@property (nonatomic, readwrite) NSString *logo;

@end

@implementation Job

- (instancetype) initWithDictionary : (NSDictionary *)myDict {
    self = [super init];
    if (self){
        _title = myDict[@"title"];
        _company = myDict[@"company"];
        _desc = myDict[@"description"];
        _url = myDict[@"company_url"];
        _logo = myDict[@"company_logo"];
    }
    return self;
}

@end
