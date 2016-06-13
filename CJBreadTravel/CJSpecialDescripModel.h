//
//  CJSpecialDescripModel.h
//  CJBreadTravel
//
//  Created by mac on 16/6/13.
//  Copyright © 2016年 Cijian.Wu. All rights reserved.
//

#import "JSONModel.h"


@protocol CJSpecialDescripModel



@end

@interface CJSpecialDescripModel : JSONModel


/** 图片 */
@property(nonatomic,copy) NSString *photo_w640;
/** 内容 */
@property(nonatomic,copy) NSString *text;
/** 地名 */
@property(nonatomic,copy) NSString<Optional> *name;
/** 时间 */
@property(nonatomic,copy) NSString *local_time;

@end
