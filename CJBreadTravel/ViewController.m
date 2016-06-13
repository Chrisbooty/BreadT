//
//  ViewController.m
//  CJBreadTravel
//
//  Created by mac on 16/6/13.
//  Copyright © 2016年 Cijian.Wu. All rights reserved.
//

#import "ViewController.h"
#import "CJHeader.h"
#import "CJStoryDetailsController.h"
#import "CJSpecialContentTableController.h"
#import "MJRefresh.h"

@interface ViewController ()<CJIntersetCellDelegate>

/** scrollView数据源 */
@property(nonatomic,strong) NSMutableArray *scrollViewModelArrM;
/** 精选故事数据源 */
@property(nonatomic,strong) NSMutableArray *InterestModelArrM;
/** 原创专题数据源 */
@property(nonatomic,strong) NSMutableArray *specialModelArrM;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSArray *arr = [[CJTools sharedTool] searchEntity:@"ScrollViewModel"];
    if (arr.count !=0) {
        _scrollViewModelArrM = [NSMutableArray arrayWithArray:arr];
        NSArray *array = [[CJTools sharedTool] searchEntity:@"IntersetModel"];
        _InterestModelArrM = [NSMutableArray arrayWithArray:array];
        [self.tableView reloadData];
    }
    
    [self requestData];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"CJIntersetCell" bundle:nil] forCellReuseIdentifier:@"interset"];
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self requestData];
    }];
    
}

- (void)requestData
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:INDEX_URL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSArray *arr = responseObject[@"data"][@"elements"];
        [self.scrollViewModelArrM removeAllObjects];
        [[CJTools sharedTool] deleteAllObjectWithEntityName:@"ScrollViewModel"];
        for (NSDictionary *dict in arr) {
            //scrollView数据请求
            if ([dict[@"type"] integerValue] == 1) {
                for (NSDictionary *diction in [dict[@"data"] lastObject]) {
                    CJScrollViewModel *model = [[CJScrollViewModel alloc] initWithDictionary:diction error:nil];
                    [self.scrollViewModelArrM addObject:model];
                    [[CJTools sharedTool] insertEntityWithName:@"ScrollViewModel" withModel:diction];
                }
            }
        }
        //精选故事数据请求
        [self.InterestModelArrM removeAllObjects];
        [[CJTools sharedTool] deleteAllObjectWithEntityName:@"IntersetModel"];
        for (NSDictionary *dict in arr) {
            if ([dict[@"type"] integerValue] == 10) {
                for (NSDictionary *diction in dict[@"data"]) {
                    CJIntersetModel *model = [[CJIntersetModel alloc] initWithDictionary:diction error:nil];
                    [self.InterestModelArrM addObject:model];
                    [[CJTools sharedTool] insertEntityWithName:@"IntersetModel" withModel:diction];
                }
            }
        }
        //原创专题数据请求
        for (NSDictionary *dict in arr) {
            if ([dict[@"type"] integerValue] == 4) {
                for (NSDictionary *diction in dict[@"data"]) {
                    
                    CJSpecialModel *model = [[CJSpecialModel alloc] initWithDictionary:diction error:nil];
                    [self.specialModelArrM addObject:model];
                }
            }
        }
        [self.tableView.mj_header endRefreshing];
        [self.tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.specialModelArrM.count == 0  && self.InterestModelArrM.count == 0) {
        return 0;
    }
    return self.specialModelArrM.count+2;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        CJScrollViewTableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"scrollview"];
        cell.dataArrM = self.scrollViewModelArrM;
        return cell;
    }else if (indexPath.row == 1)
    {
        CJIntersetCell *cell = [tableView dequeueReusableCellWithIdentifier:@"interset"];
        cell.dataArrM = self.InterestModelArrM;
        cell.delegate = self;
        return cell;
    }else
    {
        CJSpecialTableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"special"];
        cell.model = self.specialModelArrM[indexPath.row - 2];
        return cell;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 185;
    }else if (indexPath.row == 1)
    {
        return 481;
    }else
    {
        return 216;
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row > 1) {
        CJSpecialContentTableController *VC = [self.storyboard instantiateViewControllerWithIdentifier:@"specialContent"];
        VC.id_URL = [[self.specialModelArrM[indexPath.row - 2] contentiId] stringValue];
        [self.navigationController pushViewController:VC animated:YES];
    }
}

-(void)presentController:(NSString *)str
{
    CJStoryDetailsController *VC = [self.storyboard instantiateViewControllerWithIdentifier:@"storyDetails"];
    VC.spot_id = str;
    [self.navigationController pushViewController:VC animated:YES];
}

#pragma mark - scrollView数据源懒加载
-(NSMutableArray *)scrollViewModelArrM
{
    if (_scrollViewModelArrM == nil) {
        _scrollViewModelArrM = [NSMutableArray array];
        
    }
    return _scrollViewModelArrM;
}
#pragma mark - 精选故事数据源懒加载
-(NSMutableArray *)InterestModelArrM
{
    if (_InterestModelArrM == nil) {
        _InterestModelArrM = [NSMutableArray array];
    }
    return _InterestModelArrM;
}
#pragma mark - 原创专题数据源懒加载
-(NSMutableArray *)specialModelArrM
{
    if (_specialModelArrM == nil) {
        _specialModelArrM = [NSMutableArray array];
    }
    return _specialModelArrM;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
