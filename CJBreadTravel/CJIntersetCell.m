//
//  CJIntersetCell.m
//  CJBreadTravel
//
//  Created by mac on 16/6/13.
//  Copyright © 2016年 Cijian.Wu. All rights reserved.
//

#import "CJIntersetCell.h"
#import "CJIntersetCollectionCell.h"


@interface CJIntersetCell ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *collectView;


@end

@implementation CJIntersetCell

-(void)awakeFromNib
{
    [self.collectView registerNib:[UINib nibWithNibName:@"CJIntersetCollectionCell" bundle:nil] forCellWithReuseIdentifier:@"collectionCell"];
    self.collectView.delegate = self;
    self.collectView.dataSource = self;
}

- (void)setDataArrM:(NSMutableArray *)dataArrM
{
    _dataArrM = dataArrM;
    [self.collectView reloadData];
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (self.dataArrM.count >4) {
        return 4;
    }
    return self.dataArrM.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CJIntersetCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionCell" forIndexPath:indexPath];
    cell.model = self.dataArrM[indexPath.row];
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self.delegate presentController:[[self.dataArrM[indexPath.row] spot_id] stringValue]];
}

@end
