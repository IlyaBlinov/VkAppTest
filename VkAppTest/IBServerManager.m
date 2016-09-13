//
//  IBServerManager.m
//  VkAppTest
//
//  Created by ilyablinov on 12.09.16.
//  Copyright (c) 2016 IB. All rights reserved.
//

#import "IBServerManager.h"

@implementation IBServerManager


+ (IBServerManager*) sharedManager{
    
    static IBServerManager *manager = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[IBServerManager alloc] init];
    });
    
    return manager;
    
}


- (void) getFriendsWithOffset: (NSInteger) offset
                        count: (NSInteger) count
                    onSuccess:(void(^) (NSArray *friends)) success
                    onFailure:(void (^)(NSError *error, NSInteger statusCode)) failure{
    
    
    
    
    
    
}



@end
