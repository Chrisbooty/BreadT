//
//  CJIntersetCell.h
//  CJBreadTravel
//
//  Created by mac on 16/6/13.
//  Copyright © 2016年 Cijian.Wu. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CJIntersetCellDelegate

- (void)presentController:(NSString *)str;

@end

@interface CJIntersetCell : UITableViewCell

/** 数据源 */
@property(nonatomic,strong) NSMutableArray *dataArrM;

/** delegate */
@property(nonatomic,weak) id<CJIntersetCellDelegate> delegate;

@end
