//
//  CJIntersetModel.m
//  CJBreadTravel
//
//  Created by mac on 16/6/13.
//  Copyright © 2016年 Cijian.Wu. All rights reserved.
//

#import "CJIntersetModel.h"

@implementation CJIntersetModel

+(JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{@"user.name":@"name",@"user.avatar_m":@"avatar_m"}];
}

@end