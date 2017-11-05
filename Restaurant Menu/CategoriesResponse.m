//
//  CategoryResponse.m
//  Restaurant Menu
//
//  Created by Shaker on 11/5/17.
//  Copyright © 2017 Shaker. All rights reserved.
//

#import "CategoriesResponse.h"
#import "AFNetworking.h"

#define MENU_CATEGORIES_URL @"http://elmenus.getsandbox.com/menu"


@implementation CategoriesResponse

+ (void)loadAllMenuCategories:(void (^)(NSArray<MenuCategory *> *categories))successBlock failureBlock:(void (^)(NSString *errorMessage))failureBlock
{
    NSURL *baseURL = [[NSURL alloc] initWithString:@""];
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:baseURL];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [manager GET:MENU_CATEGORIES_URL parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"JSON: %@", responseObject);
        NSError *error;
        CategoriesResponse *response = [[CategoriesResponse alloc] initWithDictionary:responseObject error:&error];
        if (error || !response) {
            failureBlock(@"Something wen wrong while trying to load categories. Please try again later.");
            return;
        }
        successBlock(response.categories);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"Error: %@", [error localizedDescription]);
        failureBlock(@"Something wen wrong while trying to load categories. Please try again later.");
        
    }];
}


+ (Class)classForCollectionProperty:(NSString *)propertyName
{
    if ([propertyName isEqualToString:@"categories"])
        return [MenuCategory class];
    
    return nil;
}

@end
