//
//  MyCustomerVC.m
//  DLIntellectualProperty
//
//  Created by 博瀚程 on 2019/11/13.
//  Copyright © 2019 博瀚程. All rights reserved.
//

#import "MyCustomerVC.h"
#import "GrayLine2TableViewCell.h"
#import "DLMyVisitCell.h"
@interface MyCustomerVC ()<UITableViewDelegate, UITableViewDataSource>
@property(nonatomic, weak)IBOutlet UITableView *tableList;
@end

@implementation MyCustomerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"我的意向客户";
    [self setUI];
    // Do any additional setup after loading the view from its nib.
}

- (void)setUI {
    _tableList.showsVerticalScrollIndicator = NO;
    _tableList.separatorStyle = UITableViewCellSeparatorStyleNone;
     [_tableList registerNib:[UINib nibWithNibName:@"GrayLine2TableViewCell" bundle:nil] forCellReuseIdentifier:@"GrayLine2TableViewCell"];
     [_tableList registerNib:[UINib nibWithNibName:@"DLMyVisitCell" bundle:nil] forCellReuseIdentifier:@"DLMyVisitCell"];
    _tableList.delegate = self;
    _tableList.dataSource = self;
    _tableList.estimatedRowHeight = 44;
    _tableList.backgroundColor = DLRGB(237, 237, 237);
    
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row % 2 == 0) {
        GrayLine2TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GrayLine2TableViewCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    } else {
        NSArray *companyArr = @[@"",@"辽宁灯笼知识产权服务有限公司",@"",@"沈阳安城科技有限公司",@"",@"沈阳蓝米科技有限公司"];
        NSArray *nameArr =@[@"",@"吴斌",@"",@"高女士",@"",@"韩俊博"];
        NSArray *telArr =@[@"",@"400-109-4688",@"",@"17640246507",@"",@"15940001443"];
        NSArray *timeArr = @[@"",@"2019.11.18",@"",@"2019.11.18",@"",@"2019.11.18"];
        DLMyVisitCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DLMyVisitCell"];
        cell.stateImg.hidden = YES;
        cell.companyLab.text = companyArr[indexPath.row];
        cell.telLab.text = telArr[indexPath.row];
        cell.nameLab.text = nameArr[indexPath.row];
        cell.timeLab.text = timeArr[indexPath.row];
        cell.stateLab.hidden = YES;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
