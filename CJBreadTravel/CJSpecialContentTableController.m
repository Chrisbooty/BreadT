//
//  CJSpecialContentTableController.m
//  CJBreadTravel
//
//  Created by mac on 16/6/13.
//  Copyright © 2016年 Cijian.Wu. All rights reserved.
//

#import "CJSpecialContentTableController.h"
#import "CJHeader.h"
#import "CJSpecialsHeaderView.h"
#import "CJSpecialContentTableViewCell.h"

@interface CJSpecialContentTableController ()

/** cell数据源 */
@property(nonatomic,strong) NSMutableArray *cellDataArrM;
///** header数据源 */
//@property(nonatomic,strong) NSMutableArray *headerDataArrM;

@end

@implementation CJSpecialContentTableController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 300;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"CJSpecialContentTableViewCell" bundle:nil] forCellReuseIdentifier:@"CJSpecialContentTableViewCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"CJSpecialsHeaderView" bundle:nil] forHeaderFooterViewReuseIdentifier:@"CJSpecialsHeaderView"];
    [self requestData];
}

- (void)requestData
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:[NSString stringWithFormat:SPECIAL_URL,self.id_URL] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        for (NSDictionary *dict in responseObject[@"days"]) {
            CJSpecialContentModel *model = [[CJSpecialContentModel alloc] initWithDictionary:dict error:nil];
            [self.cellDataArrM addObject:model];
        }
        [self.tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return self.cellDataArrM.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    CJSpecialContentModel *model = self.cellDataArrM[section];
    return model.waypoints.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CJSpecialContentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CJSpecialContentTableViewCell"];
    CJSpecialContentModel *model = self.cellDataArrM[indexPath.section];
    CJSpecialDescripModel *desModel = model.waypoints[indexPath.row];
    cell.model = desModel;
    
    // Configure the cell...
    
    return cell;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    CJSpecialsHeaderView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"CJSpecialsHeaderView"];
    CJSpecialContentModel *model = self.cellDataArrM[section];
    view.model = model;
    return view;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0;
}


- (NSMutableArray *)cellDataArrM
{
    if (_cellDataArrM == nil) {
        _cellDataArrM = [NSMutableArray array];
    }
    return _cellDataArrM;
}
//-(NSMutableArray *)headerDataArrM
//{
//    if (_headerDataArrM == nil) {
//        _headerDataArrM = [NSMutableArray array];
//    }
//    return _headerDataArrM;
//    
//}

@end
