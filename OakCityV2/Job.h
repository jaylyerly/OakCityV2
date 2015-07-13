//
//  DataObject.h
//  OakCityV2
//
//  Created by Josh Green on 6/29/15.
//  Copyright (c) 2015 Josh Green. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Job : NSObject

@property (nonatomic, readonly) NSString *title;
@property (nonatomic, readonly) NSString *company;
@property (nonatomic, readonly) NSString *desc;
@property (nonatomic, readonly) NSString *url;
@property (nonatomic, readonly) NSString *logo;

- (instancetype) initWithDictionary : (NSDictionary *)myDict;

@end
