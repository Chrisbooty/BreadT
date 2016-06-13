//
//  CJSpecialDescripModel.m
//  CJBreadTravel
//
//  Created by mac on 16/6/13.
//  Copyright © 2016年 Cijian.Wu. All rights reserved.
//

#import "CJSpecialDescripModel.h"

@implementation CJSpecialDescripModel

+ (JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{@"waypoints.name":@"name"}];
}


@end
