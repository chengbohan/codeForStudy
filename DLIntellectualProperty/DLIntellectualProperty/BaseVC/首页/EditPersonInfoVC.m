//
//  EditPersonInfoVC.m
//  DLIntellectualProperty
//
//  Created by 博瀚程 on 2019/11/7.
//  Copyright © 2019 博瀚程. All rights reserved.
//

#import "EditPersonInfoVC.h"
#import "GrayLine2TableViewCell.h"
#import "FieldTableViewCell.h"
#import "BtnTableViewCell.h"
#import "DLQuestionListVC.h"
#import "DLSelectItemVC.h"
#import "SelectTradeVC.h"
#import "TextFeildInputVC.h"
@interface EditPersonInfoVC ()<UITableViewDelegate, UITableViewDataSource>
@property(nonatomic, weak)IBOutlet UITableView *tableList;
@property(nonatomic, strong)NSMutableArray <NSString *>*dataArr;
@end

@implementation EditPersonInfoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUI];
    self.navigationItem.title = @"信息完善";
    UIButton *leftBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 80, 30)];
    [leftBtn setTitle:@"返回" forState:UIControlStateNormal];
    [leftBtn setImage:DLImage(@"back") forState:UIControlStateNormal];
    [leftBtn setImage:DLImage(@"back") forState:UIControlStateHighlighted];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    
    _dataArr = [NSMutableArray arrayWithObjects:@"X", @"", @"", @"X", @"", @"", @"", @"", nil];
    //self.navigationItem.leftBarButtonItem = item;
    // Do any additional setup after loading the view from its nib.
}

- (void)setUI {
    
    _tableList.delegate =self;
    _tableList.backgroundColor = DLRGB(237, 237, 237);
    _tableList.dataSource = self;
    [_tableList registerNib:[UINib nibWithNibName:@"GrayLine2TableViewCell" bundle:nil] forCellReuseIdentifier:@"GrayLine2TableViewCell"];
    [_tableList registerNib:[UINib nibWithNibName:@"FieldTableViewCell" bundle:nil] forCellReuseIdentifier:@"FieldTableViewCell"];
    [_tableList registerNib:[UINib nibWithNibName:@"BtnTableViewCell" bundle:nil] forCellReuseIdentifier:@"BtnTableViewCell"];
    _tableList.estimatedRowHeight = 40;
    _tableList.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 9;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0 || indexPath.row == 3) {
        GrayLine2TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GrayLine2TableViewCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    } else if(indexPath.row == 1 || indexPath.row == 2 ||indexPath.row == 4 || indexPath.row == 5 || indexPath.row == 6 || indexPath.row == 7){
        NSArray *titleArr = @[@"",@"公司名称",@"公司联系人姓名",@"",@"公司电话/联系人电话",@"推荐人编号",@"所属行业",@"公司地址"];
        NSArray *starArr = @[@"",@"1",@"1",@"",@"1",@"",@"",@""];
        NSArray *contentArr = @[@"",@"请填写公司名称",@"请填写联系人姓名",@"",@"请填写电话号码",@"请填写推荐人编号",@"请选择所属行业",@"请填写公司地址"];
        FieldTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FieldTableViewCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.titleLab.text = titleArr[indexPath.row];
        cell.contentLab.text = contentArr[indexPath.row];
        if (![_dataArr[indexPath.row] isEqualToString:@""]) {
            cell.contentLab.text = _dataArr[indexPath.row];
            cell.contentLab.textColor =DLRGBHex(0x333333);
        } else {
            cell.contentLab.text = contentArr[indexPath.row];
            cell.contentLab.textColor =DLRGBHex(0x999999);
        }
        if ([((NSString *)starArr[indexPath.row]) isEqualToString:@"1"]) {
            cell.starLab.hidden = NO;
        } else {
            cell.starLab.hidden = YES;
        }
        return cell;
    } else {
        WeakSelf(self);
        BtnTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BtnTableViewCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = DLRGB(237, 237, 237);
        [cell.btn clickBtnBlock:^(UIButton * _Nonnull btn) {
            NSLog(@"点击");
            DLQuestionListVC *vc = [DLQuestionListVC new];
            [self.navigationController pushViewController:vc animated:YES];
        }];
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"点击");
    if (indexPath.row == 6) {
        SelectTradeVC *vc = [[SelectTradeVC alloc] initWithNibName:@"SelectTradeVC" bundle:nil];
        [self.navigationController pushViewController:vc animated:YES];
    } else {
        return;
        NSArray *contentArr = @[@"",@"请填写公司名称",@"请填写联系人姓名",@"",@"请填写电话号码",@"请填写推荐人编号",@"请选择所属行业",@"请填写公司地址"];
        TextFeildInputVC *vc = [TextFeildInputVC new];
        vc.dataArr = self.dataArr;
        vc.plaholder = contentArr[indexPath.row];
        [self.navigationController pushViewController:vc animated:YES];
        
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
