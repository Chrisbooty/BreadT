//
//  CJStoryDetailsModel.h
//  CJBreadTravel
//
//  Created by mac on 16/6/13.
//  Copyright © 2016年 Cijian.Wu. All rights reserved.
//

#import "JSONModel.h"

@interface CJStoryDetailsModel : JSONModel

/** 用户名 */
@property(nonatomic,copy) NSString *name;
/** 用户头像 */
@property(nonatomic,copy) NSString *avatar_m;
/** 浏览 */
@property(nonatomic,strong) NSNumber *view_count;
/** 标题 */
@property(nonatomic,copy) NSString *text;


@end
