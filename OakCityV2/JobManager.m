//
//  JobManager.m
//  OakCityV2
//
//  Created by Josh Green on 7/6/15.
//  Copyright (c) 2015 Josh Green. All rights reserved.
//

#import "JobManager.h"

#define LANGUAGE @"PHP"
#define TOWN @"San+Francisco"

@implementation JobManager

- (AFURLSessionManager *)searchJobs
{
    static AFURLSessionManager *searchJobs = nil;
    NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    searchJobs = [[AFURLSessionManager alloc] initWithSessionConfiguration:sessionConfiguration];
    [searchJobs setResponseSerializer:[AFJSONResponseSerializer serializer]];
    NSString *urlAsString = [NSString stringWithFormat:@"https://jobs.github.com/positions.json?description=%@&location=%@", LANGUAGE, TOWN];
    NSURL *url = [NSURL URLWithString:urlAsString];
    NSURLRequest *request = [NSURLRequest requestWithURL: url];
    [[searchJobs dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        self.jobs  = (NSArray *)responseObject;
        NSLog(@"%@", responseObject);
        
    }]resume];
    
    return searchJobs;
}

/*
 Job *job = [[Job alloc] init];
 job.title = [self.jobs valueForKey: @"title"];
 job.company = [self.jobs valueForKey: @"company"];
 job.url = [self.jobs valueForKey: @"company_url"];
 job.logo = [self.jobs valueForKey: @"company_logo"];
 job.desc = [self.jobs valueForKey: @"description"];
 */

@end
