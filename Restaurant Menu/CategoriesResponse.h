//
//  CategoriesResponse.h
//  Restaurant Menu
//
//  Created by Shaker on 11/5/17.
//  Copyright © 2017 Shaker. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "MenuCategory.h"

@interface CategoriesResponse : JSONModel

@property (nonatomic) NSArray <MenuCategory *> *categories;

+ (void)loadAllMenuCategories:(void (^)(NSArray<MenuCategory *> *categories))successBlock failureBlock:(void (^)(NSString *errorMessage))failureBlock;

@end
