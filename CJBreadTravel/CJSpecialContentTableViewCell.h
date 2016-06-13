//
//  CJSpecialContentTableViewCell.h
//  CJBreadTravel
//
//  Created by mac on 16/6/13.
//  Copyright © 2016年 Cijian.Wu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CJSpecialDescripModel.h"

@interface CJSpecialContentTableViewCell : UITableViewCell

/** model */
@property(nonatomic,strong) CJSpecialDescripModel *model;
@property (weak, nonatomic) IBOutlet UILabel *textL;
@end
