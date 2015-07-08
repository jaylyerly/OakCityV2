//
//  DataObject.h
//  OakCityV2
//
//  Created by Josh Green on 6/29/15.
//  Copyright (c) 2015 Josh Green. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Job : NSObject

@property (nonatomic, readwrite) NSString *title;
@property (nonatomic, readwrite) NSString *company;
@property (nonatomic, readwrite) NSString *desc;
@property (nonatomic, readwrite) NSString *url;
@property (nonatomic, readwrite) NSString *logo;

- (instancetype) initWithDictionary : (NSDictionary *)myDict;

@end
