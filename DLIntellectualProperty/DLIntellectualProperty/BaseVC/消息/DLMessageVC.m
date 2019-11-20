//
//  DLMessageVC.m
//  DLIntellectualProperty
//
//  Created by 博瀚程 on 2019/11/8.
//  Copyright © 2019 博瀚程. All rights reserved.
//

#import "DLMessageVC.h"
#import "ItemBarView.h"
#import "GrayLine2TableViewCell.h"
#import "MessageTableViewCell.h"
#import "DLNoticeDetailVC.h"
#import "TalkVC.h"
@interface DLMessageVC ()<UITableViewDelegate, UITableViewDataSource>
@property(nonatomic, weak)IBOutlet ItemBarView *barView;
@property(nonatomic, weak)IBOutlet DLTableView *table1;
@property(nonatomic, weak)IBOutlet DLTableView *table2;
@end

@implementation DLMessageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"消息中心";
    [self setUI];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

}

- (void)setUI {
    WeakSelf(self);
    _table2.delegate = self;
    _table2.dataSource = self;
    _table1.delegate = self;
    _table1.dataSource = self;
    _table2.hidden = YES;
    _table1.hidden = NO;
    _table1.tag = 1;
    _table2.tag = 2;
    [_table2 registerNib:[UINib nibWithNibName:@"GrayLine2TableViewCell" bundle:nil] forCellReuseIdentifier:@"GrayLine2TableViewCell"];
    [_table1 registerNib:[UINib nibWithNibName:@"GrayLine2TableViewCell" bundle:nil] forCellReuseIdentifier:@"GrayLine2TableViewCell"];
    [_table2 registerNib:[UINib nibWithNibName:@"MessageTableViewCell" bundle:nil] forCellReuseIdentifier:@"MessageTableViewCell"];
    [_table1 registerNib:[UINib nibWithNibName:@"MessageTableViewCell" bundle:nil] forCellReuseIdentifier:@"MessageTableViewCell"];
    _table1.estimatedRowHeight = 44;
    _table2.estimatedRowHeight = 44;
    [_barView clickItemBlock:^(NSInteger index) {
        NSSLog(@"index %ld",index);
        if (index == 1) {
            weakself.table1.hidden = NO;
            weakself.table2.hidden = YES;
        } else {
            weakself.table1.hidden = YES;
            weakself.table2.hidden = NO;
        }
    }];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView.tag == 1) {
        return 4;
    } else {
        return 4;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView.tag == 1) {
        //通知
        if (indexPath.row == 0) {
            GrayLine2TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GrayLine2TableViewCell"];
            return cell;
        } else {
            NSArray *contentArr = @[@"",@"喜从天降！从即日“知政达”问诊限时免费啦~",@"“知政达”政策问诊功能正式上线！您可以浏览最新、最及时、最准确的企业"
                ,@"“知政达”所属公司“辽宁灯笼知识产权有限公司”已参加全国创新创业大赛总决赛，点击查看详情！"];
            NSArray *timeArr = @[@"",@"2019-11-02",@"2019-10-16",@"2019-10-07"];
            MessageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MessageTableViewCell"];
            cell.content.text = contentArr[indexPath.row];
            cell.title.text = @"系统通知";
            cell.timeLab.hidden = NO;
            cell.timeLab.text = timeArr[indexPath.row];
            cell.arrowImg.hidden = YES;
            return cell;
        }
    } else {
      
      if (indexPath.row == 0) {
            GrayLine2TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GrayLine2TableViewCell"];
            return cell;
      } else {
          NSArray *contentArr = @[@"",@"你们诊断的服务真的不错！我们公司现在的情况应该怎么处理呢？",@"感谢您的咨询，您企业的问题我们会及时处理与跟进，请保持联络哦！"
              ,@"你们服务真的全面！有联系电话吗？"];
          NSArray *titleArr = @[@"",@"服务管家-斌斌",@"服务管家-王霜",@"服务管家-松松"];
          MessageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MessageTableViewCell"];
          cell.timeLab.hidden = YES;
          cell.content.text = contentArr[indexPath.row];
          cell.title.text = titleArr[indexPath.row];
          cell.arrowImg.hidden = NO;
          return cell;
          
      }
    }
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    if (tableView.tag == 1) {
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        DLNoticeDetailVC *vc = [DLNoticeDetailVC new];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    } else {
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        TalkVC *vc = [TalkVC new];
        vc.hidesBottomBarWhenPushed = YES;
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
