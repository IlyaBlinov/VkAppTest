//
//  IBUser.h
//  VkAppTest
//
//  Created by ilyablinov on 13.09.16.
//  Copyright (c) 2016 IB. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IBUser : NSObject


@property (strong, nonatomic) NSString *firstName;
@property (strong, nonatomic) NSString *lastName;
@property (strong, nonatomic) NSURL *imageURL;

- (id) initWithServerResponse: (NSDictionary*) responseObject;

@end
