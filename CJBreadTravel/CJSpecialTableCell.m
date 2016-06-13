//
//  CJSpecialTableCell.m
//  CJBreadTravel
//
//  Created by mac on 16/6/13.
//  Copyright © 2016年 Cijian.Wu. All rights reserved.
//

#import "CJSpecialTableCell.h"
#import "UIImageView+WebCache.h"

@interface CJSpecialTableCell ()

@property (weak, nonatomic) IBOutlet UIImageView *bgView;

@property (weak, nonatomic) IBOutlet UILabel *nameL;

@property (weak, nonatomic) IBOutlet UILabel *timeL;
@property (weak, nonatomic) IBOutlet UILabel *locaL;
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *userNameL;

@end


@implementation CJSpecialTableCell

- (void)awakeFromNib {
    // Initialization code
    _iconView.layer.cornerRadius = 15.0f;
    _iconView.clipsToBounds = YES;
}

-(void)setModel:(CJSpecialModel *)model
{
    _model = model;
    [_bgView sd_setImageWithURL:[NSURL URLWithString:model.cover_image] placeholderImage:[UIImage imageNamed:@"photo"]];
    _nameL.text = model.name;
    NSArray *arr = [model.first_day componentsSeparatedByString:@"-"];
    _timeL.text = [NSString stringWithFormat:@"%@.%@.%@  %@天  %@浏览",arr[0],arr[1],arr[2],model.day_count,model.view_count];
    _locaL.text = model.popular_place_str;
    [_iconView sd_setImageWithURL:[NSURL URLWithString:model.avatar_m] placeholderImage:[UIImage imageNamed:@"photo"]];
    _userNameL.text = model.userName;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
@end
