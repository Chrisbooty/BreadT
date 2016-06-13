//
//  CJUserDetailsCell.m
//  CJBreadTravel
//
//  Created by mac on 16/6/13.
//  Copyright © 2016年 Cijian.Wu. All rights reserved.
//

#import "CJUserDetailsCell.h"
#import "UIImageView+WebCache.h"

@interface CJUserDetailsCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconView;

@property (weak, nonatomic) IBOutlet UILabel *nameL;

@property (weak, nonatomic) IBOutlet UILabel *viewCountL;

@property (weak, nonatomic) IBOutlet UILabel *titleL;

@end

@implementation CJUserDetailsCell

- (void)awakeFromNib {
    // Initialization code
    _iconView.layer.cornerRadius = 30.0f;
    _iconView.clipsToBounds = YES;
}

-(void)setModel:(CJStoryDetailsModel *)model
{
    _model = model;
    [_iconView sd_setImageWithURL:[NSURL URLWithString:model.avatar_m] placeholderImage:[UIImage imageNamed:@"photo"]];
    _nameL.text = model.name;
    _viewCountL.text = [NSString stringWithFormat:@"%@浏览",model.view_count];
    _titleL.text = model.text;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
