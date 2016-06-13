//
//  CJSpecialContentModel.h
//  CJBreadTravel
//
//  Created by mac on 16/6/13.
//  Copyright © 2016年 Cijian.Wu. All rights reserved.
//

#import "JSONModel.h"
#import "CJSpecialDescripModel.h"

@interface CJSpecialContentModel : JSONModel

/** 日期 */
@property(nonatomic,copy) NSString *date;

/** 详情数组 */
@property(nonatomic,strong) NSArray<CJSpecialDescripModel> *waypoints;

@end
