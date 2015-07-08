//
//  JobManager.h
//  OakCityV2
//
//  Created by Josh Green on 7/6/15.
//  Copyright (c) 2015 Josh Green. All rights reserved.
//

#import "AFURLSessionManager.h"

@interface JobManager : AFURLSessionManager<NSURLSessionTaskDelegate>

+ (AFURLSessionManager *)searchJobs;

@end
