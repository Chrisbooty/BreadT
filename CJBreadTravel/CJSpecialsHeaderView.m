//
//  CJSpecialsHeaderView.m
//  CJBreadTravel
//
//  Created by mac on 16/6/13.
//  Copyright © 2016年 Cijian.Wu. All rights reserved.
//

#import "CJSpecialsHeaderView.h"

@interface CJSpecialsHeaderView ()

@property (weak, nonatomic) IBOutlet UILabel *dataL;


@end

@implementation CJSpecialsHeaderView



-(void)setModel:(CJSpecialContentModel *)model
{
    _model = model;
    _dataL.text = model.date;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
