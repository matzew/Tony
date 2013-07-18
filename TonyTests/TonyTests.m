//
//  TonyTests.m
//  TonyTests
//
//  Created by Matthias Wessendorf on 7/18/13.
//  Copyright (c) 2013 Red Hat. All rights reserved.
//

#import "TonyTests.h"
#import <HawkClient/HawkClient.h>
#import <AFNetworking/AFNetworking.h>

@implementation TonyTests {
    BOOL _finishedFlag;
}

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testExample
{
    // Create the credentials
    HawkCredentials *credentials = [[HawkCredentials alloc] init];
    credentials.key = @"werxhqb98rpaxn39848xrunpaw3489ruxnpa98w4rxn";
    credentials.identifier = @"dh37fgj492je";

    // some params:
    NSString *nonce = @"09B8AFD6-B784-4981-ADD5-BEFF55C9E60D";
    NSString *timestamp = [HawkClient getTimestamp];
    NSString *method = @"GET";


    NSURL *url = [NSURL URLWithString:@"http://localhost:8080/aerogear-controller-demo/autobots/"];
    
    NSString *header = [HawkClient generateAuthorizationHeader:url method:method timestamp:timestamp nonce:nonce credentials:credentials ext:nil payload:nil payloadValidation:YES];
    
    
    
    
    AFHTTPClient *client = [AFHTTPClient clientWithBaseURL:url];
    [client setDefaultHeader:@"Authorization" value:header];
    
    [client getPath:@"" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"responseObject:      %@",responseObject);
        _finishedFlag = YES;

    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"\n\nERROR: %@\n\n", [operation responseString]);
        _finishedFlag = YES;

        STFail(@"broken test is broken");
        
    }];
    
    
    // keep the run loop going
    while(!_finishedFlag) {
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
    }
}

@end
