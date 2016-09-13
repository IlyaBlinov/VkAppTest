//
//  IBServerManager.m
//  VkAppTest
//
//  Created by ilyablinov on 12.09.16.
//  Copyright (c) 2016 IB. All rights reserved.
//

#import "IBServerManager.h"
#import "AFNetworking.h"


@interface IBServerManager ()

@property (strong, nonatomic) AFHTTPRequestOperationManager *requestOperationManager;


@end






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
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:@"https://api.vk.com/method/friends.get"
      parameters:nil
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
             
        NSLog(@"JSON: %@", responseObject);
             
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
    }];
    
    
    
    
}



@end
