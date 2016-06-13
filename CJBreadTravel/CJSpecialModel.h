//
//  CJSpecialModel.h
//  CJBreadTravel
//
//  Created by mac on 16/6/13.
//  Copyright © 2016年 Cijian.Wu. All rights reserved.
//

#import "JSONModel.h"

@interface CJSpecialModel : JSONModel

/** 标题 */
@property(nonatomic,copy) NSString *name;
/** 时间 */
@property(nonatomic,copy) NSString *first_day;
/** 天数 */
@property(nonatomic,strong) NSNumber *day_count;
/** 浏览次数 */
@property(nonatomic,strong) NSNumber *view_count;
/** 地区 */
@property(nonatomic,copy) NSString *popular_place_str;
/** 用户名 */
@property(nonatomic,copy) NSString *userName;
/** 用户头像 */
@property(nonatomic,copy) NSString *avatar_m;
/** 背景图片 */
@property(nonatomic,copy) NSString *cover_image;
/** id */
@property(nonatomic,strong) NSNumber *contentiId;


@end
