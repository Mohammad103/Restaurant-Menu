//
//  MenuCategory.h
//  Restaurant Menu
//
//  Created by Shaker on 11/5/17.
//  Copyright © 2017 Shaker. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "MenuItem.h"

@interface MenuCategory : JSONModel

@property (nonatomic) NSInteger id;
@property (nonatomic) NSString *name;
@property (nonatomic) NSArray <MenuItem *> *items;

@end
