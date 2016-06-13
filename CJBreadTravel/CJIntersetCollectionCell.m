//
//  CJIntersetCollectionCell.m
//  CJBreadTravel
//
//  Created by mac on 16/6/13.
//  Copyright © 2016年 Cijian.Wu. All rights reserved.
//

#import "CJIntersetCollectionCell.h"
#import "UIImageView+WebCache.h"

@interface CJIntersetCollectionCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@property (weak, nonatomic) IBOutlet UILabel *txtL;

@property (weak, nonatomic) IBOutlet UIImageView *iconView;

@property (weak, nonatomic) IBOutlet UILabel *nameL;


@end

@implementation CJIntersetCollectionCell

-(void)awakeFromNib
{
    _iconView.layer.cornerRadius = 13.0f;
    _iconView.clipsToBounds = YES;
}


-(void)setModel:(id)model
{
    [_imgView sd_setImageWithURL:[NSURL URLWithString:[model valueForKey:@"cover_image"]] placeholderImage:[UIImage imageNamed:@"photo"]];
    _txtL.text = [model valueForKey:@"text"];
    [_iconView sd_setImageWithURL:[NSURL URLWithString:[model valueForKey:@"avatar_m"]] placeholderImage:[UIImage imageNamed:@"photo"]];
    _nameL.text = [model valueForKey:@"name"];
}

@end
