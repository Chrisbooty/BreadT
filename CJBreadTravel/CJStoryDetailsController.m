//
//  CJStoryDetailsController.m
//  CJBreadTravel
//
//  Created by mac on 16/6/13.
//  Copyright © 2016年 Cijian.Wu. All rights reserved.
//

#import "CJStoryDetailsController.h"
#import "CJHeader.h"

@interface CJStoryDetailsController ()

/** 标题数据源 */
@property(nonatomic,strong) CJStoryDetailsModel *userModel;
/** 内容数据源 */
@property(nonatomic,strong) NSMutableArray *dataArrM;

@end

@implementation CJStoryDetailsController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(NSMutableArray *)dataArrM
{
    if (_dataArrM == nil) {
        _dataArrM = [NSMutableArray array];
    }
    return _dataArrM;
}

-(void)setSpot_id:(NSString *)spot_id
{
    _spot_id = spot_id;
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:[NSString stringWithFormat:DETAILS_URL,spot_id] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        _userModel = [[CJStoryDetailsModel alloc] initWithDictionary:responseObject[@"data"] error:nil];
        for (NSDictionary *dict in responseObject[@"data"][@"spot"][@"detail_list"]) {
            CJStoryContentModel *model = [[CJStoryContentModel alloc] initWithDictionary:dict error:nil];
            [self.dataArrM addObject:model];
        }
        [self.tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.dataArrM.count == 0) {
        return 0;
    }
    return self.dataArrM.count +1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        CJUserDetailsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"usercell" forIndexPath:indexPath];
        if (_userModel != nil) {
            cell.model = _userModel;
        }
        return cell;
    }else
    {
        CJDetailsTableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"detailscell"];
        cell.model = self.dataArrM[indexPath.row - 1];
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 162;
    }
    return 450;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
