//
//  IBServerManager.h
//  VkAppTest
//
//  Created by ilyablinov on 12.09.16.
//  Copyright (c) 2016 IB. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IBServerManager : NSObject


+ (IBServerManager*) sharedManager;



- (void) getFriendsWithOffset: (NSInteger) offset
                        count: (NSInteger) count
                    onSuccess:(void(^) (NSArray *friends)) success
                    onFailure:(void (^)(NSError *error, NSInteger statusCode)) failure;


@end
