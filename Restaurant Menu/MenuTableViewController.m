//
//  MenuTableViewController.m
//  Restaurant Menu
//
//  Created by Shaker on 11/5/17.
//  Copyright © 2017 Shaker. All rights reserved.
//

#import "MenuTableViewController.h"
#import "CategoriesResponse.h"
#import "CategoryCell.h"


@interface MenuTableViewController ()

@property (nonatomic) NSArray<MenuCategory *> *categories;

@end


@implementation MenuTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupUI];
    [self loadData];
}


- (void)setupUI
{
    self.tableView.tableFooterView = [UIView new];
}


- (void)loadData
{
    [CategoriesResponse loadAllMenuCategories:^(NSArray<MenuCategory *> *categories) {
        
        self.categories = categories;
        [self.tableView reloadData];
        
    } failureBlock:^(NSString *errorMessage) {
        
        // TODO: Show alert view with error message
        
    }];
}


#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.categories.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CategoryCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CategoryCell" forIndexPath:indexPath];
    cell.titleLbl.text = [(MenuCategory *)self.categories[indexPath.row] name];
    
    return cell;
}


@end
