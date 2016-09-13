//
//  IBServerManager.m
//  VkAppTest
//
//  Created by ilyablinov on 12.09.16.
//  Copyright (c) 2016 IB. All rights reserved.
//

#import "IBServerManager.h"
#import "AFNetworking.h"
#import "IBUser.h"

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


- (instancetype)init
{
    self = [super init];
    if (self) {
        
        NSURL *url = [NSURL URLWithString:@"https://api.vk.com/method/"];
        
        
        self.requestOperationManager = [[AFHTTPRequestOperationManager alloc]
                                        initWithBaseURL:url];
        
    }
    return self;
}






- (void) getFriendsWithOffset: (NSInteger) offset
                        count: (NSInteger) count
                    onSuccess:(void(^) (NSArray *friends)) success
                    onFailure:(void (^)(NSError *error, NSInteger statusCode)) failure{
    
    
    NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:
                            @"237073493", @"user_id",
                            @"name",      @"order",
                            @(count),     @"count",
                            @(offset),    @"offset",
                            @"photo_50",  @"fields",
                            @"nom",       @"name_case",
                            nil];
   
    [self.requestOperationManager GET:@"friends.get"
      parameters:params
         success:^(AFHTTPRequestOperation *operation, NSDictionary *responseObject) {
             
             NSArray *dictArray = [responseObject objectForKey:@"response"];
             
             NSMutableArray *objectArray =  [NSMutableArray array];
             
             for (NSDictionary *dict in dictArray) {
                 IBUser *user = [[IBUser alloc]  initWithServerResponse:dict];
                 [objectArray addObject:user];
             }
             
             if (success) {
                 success(objectArray);
             }
             
        NSLog(@"JSON: %@", responseObject);
             
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
        
        if (failure) {
            failure(error, operation.response.statusCode);
        }
        
    }];
    
    
    
    
}



@end
