//
//  DLPolicyLookVC.m
//  DLIntellectualProperty
//
//  Created by 博瀚程 on 2019/11/11.
//  Copyright © 2019 博瀚程. All rights reserved.
//

#import "DLPolicyLookVC.h"
#import "GrayLine2TableViewCell.h"
#import "PolicyTableViewCell.h"
#import "DLSearchListVC.h"
#import "DLPolicyDetailVC.h"
@interface DLPolicyLookVC ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong)NSArray <UIButton *>*btnArr;
@property (nonatomic, assign)NSInteger index;
@end

@implementation DLPolicyLookVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"政策浏览";
    self.view.backgroundColor = DLRGB(237, 237, 237);
    
    [self setUI];
    // Do any additional setup after loading the view from its nib.
}



- (void)setUI {
    WeakSelf(self);
    _index = 1;
    _searchBar.placeholder = @"搜索";
    _searchBar.userInteractionEnabled = NO;
    _searchTouchView.backgroundColor = [UIColor clearColor];
    [_searchTouchView addTapGestureBlock:^(UIView * _Nonnull ownView) {
        NSLog(@"进入搜索详情页");
        DLSearchListVC *vc = [[DLSearchListVC alloc] initWithNibName:@"DLSearchListVC" bundle:nil];
        vc.hidesBottomBarWhenPushed = YES;
        [weakself.navigationController pushViewController:vc animated:YES];
    }];
    
    
    _btnArr = @[_btn1,_btn2,_btn3,_btn4];
    for (int i = 0; i < _btnArr.count; i++) {
        _btnArr[i].titleEdgeInsets = UIEdgeInsetsMake(0, -30, 0, 0);
        _btnArr[i].imageEdgeInsets = UIEdgeInsetsMake(0, 80, 0, 0);
        [_btnArr[i] setTitleColor:DLRGBHex(0x666666) forState:UIControlStateNormal];
    }
    
    _tableList.delegate = self;
    _tableList.dataSource = self;
    _tableList.showsVerticalScrollIndicator = NO;
    _tableList.backgroundColor = DLRGB(237, 237, 237);
    [_tableList registerNib:[UINib nibWithNibName:@"GrayLine2TableViewCell" bundle:nil] forCellReuseIdentifier:@"GrayLine2TableViewCell"];
    _tableList.estimatedRowHeight = 40;
    _tableList.separatorStyle = UITableViewCellSeparatorStyleNone;
    [_tableList registerNib:[UINib nibWithNibName:@"PolicyTableViewCell" bundle:nil] forCellReuseIdentifier:@"PolicyTableViewCell"];
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row % 2 == 0) {
        GrayLine2TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GrayLine2TableViewCell"];
        return cell;
    } else {
        NSInteger selectIndex = indexPath.row - _index;
        _index = _index + 1;
        NSArray *time = @[@"2019/10/09",@"常年培育",@"2019/10/09"];
        NSArray *title = @[@"沈阳市创新创业载体备案",@"沈阳市对于国家级科技企业孵化器.众创空间奖励",@"沈阳市创新创业载体备案"];
        NSArray *city = @[@"地市级",@"区县级",@"地市级"];
        NSArray *provice = @[@"辽宁",@"辽宁",@"辽宁"];
        NSArray *depart =@[@"沈阳市科学技术局",@"沈阳市科学技术局,沈阳市财政局",@"沈阳市科学技术局"];
        PolicyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PolicyTableViewCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.timeLab.text = time[selectIndex];
        cell.provinceLab.text = provice[selectIndex];
        cell.cityLab.text = city[selectIndex];
        cell.titleLab.text = title[selectIndex];
        cell.departLab.text = depart[selectIndex];
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    DLPolicyDetailVC *vc = [DLPolicyDetailVC new];
    [self.navigationController pushViewController:vc animated:YES];
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
