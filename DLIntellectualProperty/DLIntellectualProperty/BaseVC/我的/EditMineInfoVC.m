//
//  EditMineInfoVC.m
//  DLIntellectualProperty
//
//  Created by 博瀚程 on 2019/11/8.
//  Copyright © 2019 博瀚程. All rights reserved.
//

#import "EditMineInfoVC.h"
#import "GrayLine2TableViewCell.h"
#import "FieldTableViewCell.h"
#import "BtnTableViewCell.h"
#import "AvatarTableViewCell.h"
@interface EditMineInfoVC ()<UITableViewDelegate, UITableViewDataSource>
@property(nonatomic, weak)IBOutlet UITableView *tableList;
@end

@implementation EditMineInfoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = NO;
    self.navigationItem.title = @"编辑资料";

    [self setUI];
    // Do any additional setup after loading the view from its nib.
}

- (void)setUI {
    _tableList.delegate = self;
    _tableList.dataSource = self;
    _tableList.showsVerticalScrollIndicator = YES;
    _tableList.showsHorizontalScrollIndicator = YES;
    _tableList.separatorStyle = UITableViewCellSeparatorStyleNone;
    [_tableList registerNib:[UINib nibWithNibName:@"GrayLine2TableViewCell" bundle:nil] forCellReuseIdentifier:@"GrayLine2TableViewCell"];
    [_tableList registerNib:[UINib nibWithNibName:@"FieldTableViewCell" bundle:nil]
     forCellReuseIdentifier:@"FieldTableViewCell"];
    [_tableList registerNib:[UINib nibWithNibName:@"BtnTableViewCell" bundle:nil] forCellReuseIdentifier:@"BtnTableViewCell"];
    [_tableList registerNib:[UINib nibWithNibName:@"AvatarTableViewCell" bundle:nil] forCellReuseIdentifier:@"AvatarTableViewCell"];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0 || indexPath.row == 4) {
        GrayLine2TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GrayLine2TableViewCell"];
        return cell;
    } else if (indexPath.row == 1) {
        AvatarTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AvatarTableViewCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    } else if (indexPath.row == 2 || indexPath.row == 3 || indexPath.row == 5) {
        NSArray *titleArr = @[@"",@"",@"我的姓名",@"我的企业名称",@"",@"公司电话/联系人电话",@""];
        NSArray *contentArr = @[@"",@"",@"请填写姓名",@"请填企业名称",@"",@"请填写您的联系电话",@""];
        FieldTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FieldTableViewCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.titleLab.text = titleArr[indexPath.row];
        cell.contentLab.text = contentArr[indexPath.row];
        return cell;
    } else {
        BtnTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BtnTableViewCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell.btn clickBtnBlock:^(UIButton * _Nonnull btn) {
            NSSLog(@"保存");
        }];
        return cell;
    }
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
