//
//  JobParser.m
//  OakCityV2
//
//  Created by Josh Green on 7/6/15.
//  Copyright (c) 2015 Josh Green. All rights reserved.
//

#import "JobParser.h"
#import "AFNetworking/AFNetworking.h"
#import "AFNetworking/UIImageView+AFNetworking.h"
#import "Job.h"
#define LANGUAGE @"PHP"
#define TOWN @"San+Francisco"

@implementation JobParser

- (void) searchJobs
{
    NSString *urlAsString = [NSString stringWithFormat:@"https://jobs.github.com/positions.json?description=%@&location=%@", LANGUAGE, TOWN];
    NSURL *url = [NSURL URLWithString:urlAsString];
    NSURLRequest *request = [NSURLRequest requestWithURL: url];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    
    //Parse JSON
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        self.jobs  = (NSArray *)responseObject;
        
    }
     
     //Alert on fundemental errors
                                     failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                         UIAlertView *aV = [[UIAlertView alloc]
                                                            initWithTitle:@"Error" message:[error localizedDescription] delegate: nil
                                                            cancelButtonTitle:@"Ok" otherButtonTitles:nil];
                                         [aV show];
                                     }];
    [operation start];
}
@end
