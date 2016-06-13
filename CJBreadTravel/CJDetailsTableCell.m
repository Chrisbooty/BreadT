//
//  CJDetailsTableCell.m
//  CJBreadTravel
//
//  Created by mac on 16/6/13.
//  Copyright © 2016年 Cijian.Wu. All rights reserved.
//

#import "CJDetailsTableCell.h"
#import "UIImageView+WebCache.h"

@interface CJDetailsTableCell ()

@property (weak, nonatomic) IBOutlet UIImageView *bgView;

@property (weak, nonatomic) IBOutlet UILabel *desL;

@end

@implementation CJDetailsTableCell

- (void)awakeFromNib {
    // Initialization code
    
}


-(void)setModel:(CJStoryContentModel *)model
{
    _model = model;
    [_bgView sd_setImageWithURL:[NSURL URLWithString:model.photo] placeholderImage:[UIImage imageNamed:@"photo"]];
    _desL.text = model.text;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
@end
