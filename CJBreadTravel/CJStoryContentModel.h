//
//  CJStoryContentModel.h
//  CJBreadTravel
//
//  Created by mac on 16/6/13.
//  Copyright © 2016年 Cijian.Wu. All rights reserved.
//

#import "JSONModel.h"

@interface CJStoryContentModel : JSONModel

/** 图片 */
@property(nonatomic,copy) NSString *photo;
/** 内容描述 */
@property(nonatomic,copy) NSString *text;

@end
