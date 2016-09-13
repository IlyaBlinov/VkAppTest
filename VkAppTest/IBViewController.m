//
//  IBViewController.m
//  VkAppTest
//
//  Created by ilyablinov on 12.09.16.
//  Copyright (c) 2016 IB. All rights reserved.
//

#import "IBViewController.h"
#import "IBServerManager.h"
@interface IBViewController ()

@property (strong, nonatomic) NSMutableArray *friendsArray;

@end

@implementation IBViewController


static NSInteger friendsInRequest = 5;


- (void)viewDidLoad
{
    [super viewDidLoad];
    
	self.friendsArray = [NSMutableArray array];
    
    [self getFriendsFromServer];
    
        
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - API

- (void) getFriendsFromServer{
    
    [[IBServerManager sharedManager] getFriendsWithOffset:
     [self.friendsArray count] count:friendsInRequest onSuccess:^(NSArray *friends) {
        
        [self.friendsArray addObjectsFromArray:friends];
        
        [self.tableView reloadData];
        
     
    } onFailure:^(NSError *error, NSInteger statusCode) {
        
        NSLog(@"error = %@, code = %d", [error localizedDescription], statusCode);
        
        
    }];
    
    
}


#pragma mark - UITableViewDataSource


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [self.friendsArray count] + 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identifier = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    if (indexPath.row == [self.friendsArray count]) {
        cell.textLabel.text = @"LOAD MORE";
        cell.imageView.image = nil;
    }else{
    
    
    NSDictionary *friend = [self.friendsArray objectAtIndex:indexPath.row];
    
  //  NSLog(@"%@", friend);
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@ %@",
                           [friend objectForKey:@"first_name"],
                           [friend objectForKey:@"last_name"]];
    }
    return cell;
}


#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
     
    if (indexPath.row == [self.friendsArray count]) {
    
        [self getFriendsFromServer];
    
}

}

@end
