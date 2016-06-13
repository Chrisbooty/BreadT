//
//  CJSpecialModel.m
//  CJBreadTravel
//
//  Created by mac on 16/6/13.
//  Copyright © 2016年 Cijian.Wu. All rights reserved.
//

#import "CJSpecialModel.h"

@implementation CJSpecialModel

+ (JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{@"user.avatar_m":@"avatar_m",@"user.name":@"userName",@"id":@"contentiId"}];
}

@end
