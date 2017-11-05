//
//  MenuItem.h
//  Restaurant Menu
//
//  Created by Shaker on 11/5/17.
//  Copyright © 2017 Shaker. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface MenuItem : JSONModel

@property (nonatomic) NSInteger id;
@property (nonatomic) NSString *name;
@property (nonatomic) NSString *descriptionContent;

@end
