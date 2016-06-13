//
//  CJIntersetModel.h
//  CJBreadTravel
//
//  Created by mac on 16/6/13.
//  Copyright © 2016年 Cijian.Wu. All rights reserved.
//

#import "JSONModel.h"

@interface CJIntersetModel : JSONModel

/** 标题 */
@property(nonatomic,copy) NSString *text;
/** id */
@property(nonatomic,strong) NSNumber *trip_id;
/** 图标url */
@property(nonatomic,copy) NSString *avatar_m;
/** 用户名 */
@property(nonatomic,copy) NSString *name;
/** 背景图 */
@property(nonatomic,copy) NSString *cover_image;

@end
