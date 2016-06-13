//
//  CJTools.h
//  CJBreadTravel
//
//  Created by mac on 16/6/13.
//  Copyright © 2016年 Cijian.Wu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CJTools : NSObject


+ (instancetype)sharedTool;

- (NSArray *)searchEntity:(NSString *)model;
- (void)deleteAllObjectWithEntityName:(NSString *)name;
- (void)insertEntityWithName:(NSString *)name withModel:(id)model;

@end
