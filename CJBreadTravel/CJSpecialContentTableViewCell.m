//
//  CJSpecialContentTableViewCell.m
//  CJBreadTravel
//
//  Created by mac on 16/6/13.
//  Copyright © 2016年 Cijian.Wu. All rights reserved.
//

#import "CJSpecialContentTableViewCell.h"
#import "UIImageView+WebCache.h"

@interface CJSpecialContentTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@property (weak, nonatomic) IBOutlet UILabel *textL;

@property (weak, nonatomic) IBOutlet UILabel *timeL;

@property (weak, nonatomic) IBOutlet UIButton *localLabel;


@end

@implementation CJSpecialContentTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)setModel:(CJSpecialDescripModel *)model
{
    _model = model;
    [_imgView sd_setImageWithURL:[NSURL URLWithString:model.photo_w640] placeholderImage:[UIImage imageNamed:@"photo"]];
    _textL.text = model.text;
    _timeL.text = model.local_time;
    [_localLabel setTitle:model.name forState:UIControlStateNormal];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
@end
