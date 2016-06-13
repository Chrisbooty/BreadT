//
//  CJScrollViewTableCell.m
//  CJBreadTravel
//
//  Created by mac on 16/6/13.
//  Copyright © 2016年 Cijian.Wu. All rights reserved.
//

#import "CJScrollViewTableCell.h"
#import "CJHeader.h"

#define WIDTH self.frame.size.width

@interface CJScrollViewTableCell ()<UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

/** 计时器 */
@property(nonatomic,strong) NSTimer *timer;

/** 索引 */
@property(nonatomic,assign) NSInteger index;


@end

@implementation CJScrollViewTableCell

- (void)awakeFromNib {
    // Initialization code
    _index = 0;
    _timer = [NSTimer scheduledTimerWithTimeInterval:2.0f target:self selector:@selector(timerAction:) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

-(void)setDataArrM:(NSArray *)dataArrM
{
    _dataArrM = dataArrM;
    _pageControl.numberOfPages = _dataArrM.count;
    _scrollView.contentSize = CGSizeMake(WIDTH * 3, 185);
    _scrollView.pagingEnabled = YES;
    _scrollView.delegate = self;
    _scrollView.showsHorizontalScrollIndicator = NO;
    for (NSInteger i = 0; i < _dataArrM.count; i++) {
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(WIDTH *i, 0, WIDTH, 185)];
        [imgView sd_setImageWithURL:[NSURL URLWithString:[_dataArrM[i] image_url]] placeholderImage:[UIImage imageNamed:@"photo"]];
        [_scrollView addSubview:imgView];
    }
    
}

- (void)timerAction:(NSTimer *)timer
{
    _index ++;
    if (_index >= _dataArrM.count)
    {
        _index = 0;
    }
    else if (_index < 0)
    {
        _index = _dataArrM.count-1;
        
    }
    _pageControl.currentPage = _index;
    [_scrollView setContentOffset:CGPointMake(_index *WIDTH, 0) animated:YES];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
