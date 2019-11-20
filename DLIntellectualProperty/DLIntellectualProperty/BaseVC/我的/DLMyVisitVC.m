//
//  DLMyVisitVC.m
//  DLIntellectualProperty
//
//  Created by 博瀚程 on 2019/11/12.
//  Copyright © 2019 博瀚程. All rights reserved.
//

#import "DLMyVisitVC.h"
#import "ItemBarView.h"
#import "GrayLine2TableViewCell.h"
#import "DLMyVisitCell.h"

@interface DLMyVisitVC ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, weak)IBOutlet ItemBarView *barView;
@property (nonatomic, weak)IBOutlet UITableView *table1;
@property (nonatomic, weak)IBOutlet UITableView *table2;
@property (nonatomic, weak)IBOutlet UIButton *backBtn;
@end

@implementation DLMyVisitVC

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = DLRGB(237, 237, 237);
    [self setUI];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)setUI {
    WeakSelf(self);
   [_backBtn clickBtnBlock:^(UIButton * _Nonnull btn) {
       [weakself.navigationController popViewControllerAnimated:YES];
   }];
    _barView.lab1.text = @"今日访问";
    _barView.lab2.text = @"历史访问";
    [_barView clickItemBlock:^(NSInteger index) {
        if (index == 1) {
            NSSLog(@"今日访问");
            weakself.table2.hidden = YES;
            weakself.table1.hidden = NO;
        } else {
            NSSLog(@"历史访问");
            weakself.table2.hidden = NO;
            weakself.table1.hidden = YES;
        }
    }];
    
    _table2.delegate = self;
    _table2.dataSource = self;
    _table1.delegate = self;
    _table1.dataSource = self;
    _table2.hidden = YES;
    _table1.hidden = NO;
    _table1.tag = 1;
    _table2.tag = 2;
    _table1.showsVerticalScrollIndicator = NO;
    _table2.showsVerticalScrollIndicator = NO;
    [_table2 registerNib:[UINib nibWithNibName:@"GrayLine2TableViewCell" bundle:nil] forCellReuseIdentifier:@"GrayLine2TableViewCell"];
    [_table1 registerNib:[UINib nibWithNibName:@"GrayLine2TableViewCell" bundle:nil] forCellReuseIdentifier:@"GrayLine2TableViewCell"];
    [_table2 registerNib:[UINib nibWithNibName:@"DLMyVisitCell" bundle:nil] forCellReuseIdentifier:@"DLMyVisitCell"];
    [_table1 registerNib:[UINib nibWithNibName:@"DLMyVisitCell" bundle:nil] forCellReuseIdentifier:@"DLMyVisitCell"];
    _table1.backgroundColor = DLRGB(243, 243, 243);
    _table2.backgroundColor = DLRGB(243, 243, 243);
    _table1.separatorStyle = UITableViewCellSeparatorStyleNone;
    _table2.separatorStyle = UITableViewCellSeparatorStyleNone;
    _table1.estimatedRowHeight = 44;
    _table2.estimatedRowHeight = 44;
}

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
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        //1 3 5 7    0 1 2 3
        cell.companyLab.text = companyArr[indexPath.row];
        cell.nameLab.text = nameArr[indexPath.row];
        cell.telLab.text = telArr[indexPath.row];
        cell.timeLab.text = timeArr[indexPath.row];
        [cell.stateImg addTapGestureBlock:^(UIImageView * _Nonnull ownImg) {
            
        }];
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
