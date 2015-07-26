//
//  TableViewController.m
//  OakCityV2
//
//  Created by Josh Green on 6/8/15.
//  Copyright (c) 2015 Josh Green. All rights reserved.
//

#import "TableViewController.h"
#import "AFNetworking/AFNetworking.h"
#import "DetailViewController.h"
#import "DetailCell.h"
#import "Job.h"
#import "AFNetworking/UIImageView+AFNetworking.h"
#define LANGUAGE @"PHP"
#define TOWN @"San+Francisco"

@interface TableViewController ()
@property (strong, nonatomic) NSArray *jobs;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Fetch JSON
    NSString *urlAsString = [NSString stringWithFormat:@"https://jobs.github.com/positions.json?description=%@&location=%@", LANGUAGE, TOWN];
    NSURL *url = [NSURL URLWithString:urlAsString];
    NSURLRequest *request = [NSURLRequest requestWithURL: url];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    
    //Parse JSON
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSMutableArray *jobs  = [NSMutableArray new];
        NSArray *responseArray = (NSArray *)responseObject;
        for (NSDictionary *responseDict in responseArray) {
            Job* job = [[Job alloc] initWithDictionary:responseDict];
            [jobs addObject:job];
        }
        self.jobs=[NSArray arrayWithArray:jobs];

        [self.tableView reloadData];
        
        //Alert on failure to fetch JSON
        if([self.jobs count] == 0) {
            UIAlertView* alert = [[UIAlertView alloc]
                                  initWithTitle: @"Failed to retrieve data" message: nil delegate: self
                                  cancelButtonTitle: @"cancel" otherButtonTitles: @"Retry", nil];
            [alert show];
        }
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

//Alert View
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if(buttonIndex == alertView.firstOtherButtonIndex) {
        //Fetch JSON
        NSString *urlAsString = [NSString stringWithFormat:@"https://jobs.github.com/positions.json?description=%@&location=%@", LANGUAGE, TOWN];
        NSURL *url = [NSURL URLWithString:urlAsString];
        NSURLRequest *request = [NSURLRequest requestWithURL: url];
        AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
        operation.responseSerializer = [AFJSONResponseSerializer serializer];
        
        //Parse JSON
        [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSMutableArray *jobs  = [NSMutableArray new];
            NSArray *responseArray = (NSArray *)responseObject;
            for (NSDictionary *responseDict in responseArray) {
                Job* job = [[Job alloc] initWithDictionary:responseDict];
                [jobs addObject:job];
            }
            self.jobs=[NSArray arrayWithArray:jobs];
            
            [self.tableView reloadData];

            //Alert on failure to fetch JSON
            if([self.jobs count] == 0) {
                UIAlertView* alert = [[UIAlertView alloc]
                                      initWithTitle: @"Failed to retrieve data" message: nil delegate: self
                                      cancelButtonTitle: @"cancel" otherButtonTitles: @"Retry", nil];
                [alert show];
            }
         }
         
         //Upon failure
                                         failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             UIAlertView *aV = [[UIAlertView alloc]
                                initWithTitle:@"Error" message:[error localizedDescription] delegate: nil
                                cancelButtonTitle:@"Ok" otherButtonTitles:nil];
             [aV show];
         }];
        [operation start];
    }
    
}

//Pull to refresh
- (IBAction)refresh:(UIRefreshControl *)sender {
    //Fetch JSON
    NSString *urlAsString = [NSString stringWithFormat:@"https://jobs.github.com/positions.json?description=%@&location=%@", LANGUAGE, TOWN];
    NSURL *url = [NSURL URLWithString:urlAsString];
    NSURLRequest *request = [NSURLRequest requestWithURL: url];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    
    //Parse JSON
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSMutableArray *jobs  = [NSMutableArray new];
        NSArray *responseArray = (NSArray *)responseObject;
        for (NSDictionary *responseDict in responseArray) {
            Job* job = [[Job alloc] initWithDictionary:responseDict];
            [jobs addObject:job];
        }
        self.jobs=[NSArray arrayWithArray:jobs];
        
        [self.tableView reloadData];
        
        //Alert on failure to fetch JSON
        if([self.jobs count] == 0) {
            UIAlertView* alert = [[UIAlertView alloc]
                                  initWithTitle: @"Failed to retrieve data" message: nil delegate: self
                                  cancelButtonTitle: @"cancel" otherButtonTitles: @"Retry", nil];
            [alert show];
        }
    }
     
    //Upon failure
    failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                             message:[error localizedDescription]
                                                            delegate:nil
                                                   cancelButtonTitle:@"Ok"
                                                   otherButtonTitles:nil];
        [alertView show];
    }];
    [operation start];
    [sender endRefreshing];
}

- (NSInteger)numberOfSectionsInTableView:tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    return self.jobs.count;
}

- (CGFloat)tableView:(UITableView *)tableView
estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

//Fill TableView
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DetailCell" forIndexPath:indexPath];
    Job *aJob = self.jobs[indexPath.row];
    [cell configureCell:aJob];

    return cell;
}

//Fill DetailView
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"detailViewIdentifier"]) {
        DetailViewController *detailVC = segue.destinationViewController;
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        Job *theJob = self.jobs[indexPath.row];
        
        [detailVC configureView:theJob];
        
    }
    
}

@end
