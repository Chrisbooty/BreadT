//
//  CJStoryDetailsModel.m
//  CJBreadTravel
//
//  Created by mac on 16/6/13.
//  Copyright © 2016年 Cijian.Wu. All rights reserved.
//

#import "CJStoryDetailsModel.h"

@implementation CJStoryDetailsModel


+(JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{@"trip.user.name":@"name",@"trip.user.avatar_m":@"avatar_m",@"spot.view_count":@"view_count",@"spot.text":@"text"}];
}

@end
