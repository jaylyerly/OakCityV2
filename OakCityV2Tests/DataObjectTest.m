//
//  DataObjectTest.m
//  OakCityV2
//
//  Created by Josh Green on 7/1/15.
//  Copyright (c) 2015 Josh Green. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "Job.h"

@interface DataObjectTest : XCTestCase
@property (nonatomic, strong) NSDictionary *sampleDictionary;
@end

@implementation DataObjectTest

- (void)setUp {
    [super setUp];
    self.sampleDictionary = @{
                              @"company" : @"Consensus",
                              @"company_logo" : @"http://github-jobs.s3.amazonaws.com/8433211c-087b-11e5-9fa5-407472592a98.PNG",
                              @"company_url" : @"http://www.consensuscorp.com/company/careers/",
                              @"created_at" : @"Mon Jun 01 16:31:21 UTC 2015",
                              @"description" : @"I don't like that code",
                              @"how_to_apply" : @"<p>EMAIL us at consensushr@consensuscorp.com. In the SUBJECT FIELD, put the position for which you are applying and ATTACH your Word or PDF resume.</p>\n",
                              @"id" : @"88849354-087b-11e5-815b-c2d6a5e992d9",
                              @"location" : @"San Francisco, CA",
                              @"title" : @"Sr. Java Software Engineer ",
                              @"type" : @"Full Time",
                              @"url" : @"http://jobs.github.com/positions/88849354-087b-11e5-815b-c2d6a5e992d9",
    };
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testDictionaryParse {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
    Job *job = [[Job alloc] initWithDictionary : self.sampleDictionary];
    XCTAssert([job.title isEqualToString: self.sampleDictionary[@"title"]], @"Title Fails");
    XCTAssert([job.company isEqualToString: self.sampleDictionary[@"company"]], @"Company Fails");
    XCTAssert([job.logo isEqualToString: self.sampleDictionary[@"company_logo"]], @"Logo Fails");
    XCTAssert([job.url isEqualToString: self.sampleDictionary[@"company_url"]], @"URL Fails");
    XCTAssert([job.desc isEqualToString: self.sampleDictionary[@"title"]], @"Description Fails");
}


@end
