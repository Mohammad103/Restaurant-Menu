//
//  MenuItem.m
//  Restaurant Menu
//
//  Created by Shaker on 11/5/17.
//  Copyright © 2017 Shaker. All rights reserved.
//

#import "MenuItem.h"

@implementation MenuItem


+ (JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{
                                                                  @"id": @"id",
                                                                  @"name": @"name",
                                                                  @"descriptionContent": @"description"
                                                                  }];
}


@end
