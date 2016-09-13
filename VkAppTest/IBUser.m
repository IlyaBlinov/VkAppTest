//
//  IBUser.m
//  VkAppTest
//
//  Created by ilyablinov on 13.09.16.
//  Copyright (c) 2016 IB. All rights reserved.
//

#import "IBUser.h"

@implementation IBUser



- (id) initWithServerResponse: (NSDictionary*) responseObject{
    
    self = [super init];
    if (self) {
        
        self.firstName = [responseObject objectForKey:@"first_name"];
        self.lastName = [responseObject objectForKey:@"last_name"];
        
        NSString *urlString = [responseObject objectForKey:@"photo_50"];
        
        if (urlString) {
            self.imageURL = [NSURL URLWithString:urlString];
        }
        
    }
    return self;
    
    
}




@end
