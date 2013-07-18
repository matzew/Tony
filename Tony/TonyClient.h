//
//  TonyClient.h
//  Tony
//
//  Created by Matthias Wessendorf on 7/18/13.
//  Copyright (c) 2013 Red Hat. All rights reserved.
//

#import "AFHTTPClient.h"

@interface TonyClient : AFHTTPClient

+ (TonyClient *)clientFor:(NSURL *)url;

@end
